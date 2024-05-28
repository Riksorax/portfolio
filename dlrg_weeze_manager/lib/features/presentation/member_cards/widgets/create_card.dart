import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../providers/docx_template/pdf_template.notifier.dart';

class CreateCard extends ConsumerStatefulWidget {
  const CreateCard({super.key});

  @override
  ConsumerState<CreateCard> createState() => _CreateCardState();
}

class _CreateCardState extends ConsumerState<CreateCard> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    ref.watch(pdfTemplateProvider);
    return FutureBuilder<String?>(
      future: ref.read(pdfTemplateProvider.notifier).loadPdfTemplate(),
      builder: (context, snapshot) {
        return Container(
          margin: EdgeInsets.only(top: 12),
          height: deviceSize.height * .85,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                child: Column(
                  children: [
                    Container(
                      height: deviceSize.width * .165,
                      width: deviceSize.width * .3,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: snapshot.hasData
                          ? SfPdfViewer.file(
                              File(
                                snapshot.data!,
                              ),
                              canShowScrollStatus: false,
                            )
                          : const Placeholder(),
                    ),
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: null,
                          label: const Text("Drucken"),
                          icon: const Icon(Icons.print),
                        ),
                        TextButton.icon(
                          onPressed: null,
                          label: const Text("NFC"),
                          icon: const Icon(Icons.nfc),
                        ),
                        TextButton.icon(
                          onPressed: null,
                          label: const Text("Nächster"),
                          icon: const Icon(Icons.navigate_next),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: deviceSize.height * .07,),
              Card(
                child: Column(
                  children: [
                    Container(
                      height: deviceSize.width * .165,
                      width: deviceSize.width * .3,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: snapshot.hasData
                          ? SfPdfViewer.file(
                              File(
                                snapshot.data!,
                              ),
                              canShowScrollStatus: false,
                            )
                          : const Placeholder(),
                    ),
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: null,
                          label: const Text("Drucken"),
                          icon: const Icon(Icons.print),
                        ),
                        TextButton.icon(
                          onPressed: null,
                          label: const Text("NFC"),
                          icon: const Icon(Icons.nfc),
                        ),
                        TextButton.icon(
                          onPressed: null,
                          label: const Text("Nächster"),
                          icon: const Icon(Icons.navigate_next),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
