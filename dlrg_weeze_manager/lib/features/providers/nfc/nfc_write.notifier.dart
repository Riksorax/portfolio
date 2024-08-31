import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/data/models/member.dart';
import '../../shared/providers/firebase_repository.provider.dart';
import '../entrance/entrance.notifier.dart';

part 'nfc_write.notifier.g.dart';

@riverpod
class NfcWriteNotifier extends _$NfcWriteNotifier {
  @override
  Member build() {
    return Member(
      "",
      "",
      "",
      "",
      false,
      false,
      DateTime.now(),
    );
  }

  void scanMember() async{
    try {
      NfcManager nfc = NfcManager.instance;
      if (!await nfc.isAvailable()) {
        print('NFC wird nicht unterstützt.');
        return; // NFC wird nicht unterstützt
      }

      // Starte die NFC-Session
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        // Beispiel für NDEF-Tag
        var ndef = Ndef.from(tag);
        if (ndef == null) {
          print('Kein NDEF-Tag entdeckt.');
          NfcManager.instance.stopSession();
          return;
        }

        // Lese NDEF-Nachricht
        NdefMessage? ndefMessage = ndef.cachedMessage;
        if (ndefMessage != null) {
          for (NdefRecord record in ndefMessage.records) {
            String recordType = utf8.decode(record.type);
            if (record.typeNameFormat == NdefTypeNameFormat.nfcWellknown) {
              if (recordType == 'T') {
                // Text auslesen
                var payload = record.payload;
                var languageCodeLength = payload[0];
                var text = utf8.decode(payload.sublist(1 + languageCodeLength));
                print('NDEF-Text: $text');
                var member = await ref.read(GetMemberRepoProvider(text).future);
                if (member == null) {
                  return;
                }
                ref.read(entranceNotifierProvider.notifier).addEntranceList(member);
                state = member;
              }
            }
          }
        }

        // Stoppe die NFC-Session
        NfcManager.instance.stopSession();
      });
    } catch (e) {
      print('Fehler beim Lesen der NFC-Karte: $e');
      return null;
    }
  }
}
