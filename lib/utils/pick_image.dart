<<<<<<< HEAD
// ignore_for_file: no_leading_underscores_for_local_identifiers

=======
>>>>>>> 7799cfd785c56b751454cc01a3baf169473d80c8
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
<<<<<<< HEAD

=======
>>>>>>> 7799cfd785c56b751454cc01a3baf169473d80c8
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
<<<<<<< HEAD
=======
  print('No Image Selected');
>>>>>>> 7799cfd785c56b751454cc01a3baf169473d80c8
}