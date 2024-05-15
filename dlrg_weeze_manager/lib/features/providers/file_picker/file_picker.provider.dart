import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_picker.provider.g.dart';

@riverpod
class FilePickerNotifier extends _$FilePickerNotifier {
  @override
  Future<String?> build() async {
    var picker = await FilePicker.platform.pickFiles();
    String? file = "";
    if (picker != null) {
      file = picker.paths[0];
    }
    return file;
  }
}
