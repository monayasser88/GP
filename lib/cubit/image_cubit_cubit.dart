import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';
part 'image_cubit_state.dart';

class ImageCubitCubit extends Cubit<ImageCubitState> {
  final _picker = ImagePicker();

  ImageCubitCubit() : super(ImageCubitInitial());

  Future<String?> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return pickedFile.path;
    }

    return null;
  }

  Future<String> uploadImage(File imageFile) async {
    
    final url = Uri.parse('');
    final request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return responseBody;
    } else {
      throw Exception('Failed to upload image');
    }
  }

  void setImage(String imageUrl) {
    emit(ImageLoaded(imageUrl));
  }
}
