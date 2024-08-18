import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usb_write.notifier.g.dart';

@riverpod
class UsbWriteNotifier extends _$UsbWriteNotifier {
@override
String build() {
return "";
}

void getSerialPort(){
  List<String> availablePorts = SerialPort.availablePorts;
  final port = SerialPort(availablePorts[0]);
  final test = port.openReadWrite();
  print(port.name);
  print(port.description);
  print(port.macAddress);
}

}