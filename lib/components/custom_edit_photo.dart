import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/cubit/image_cubit_cubit.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatefulWidget {
  const PickImageWidget({Key? key}) : super(key: key);

  @override
  _PickImageWidgetState createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  late ImageCubitCubit imageCubitCubit;

  @override
  void initState() {
    super.initState();
    imageCubitCubit = context.read<ImageCubitCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageCubitCubit, ImageCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
          width: 120,
          height: 120,
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage: _getImageProvider(),
            child: Stack(
              children: [
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () async {
                      final pickedImage = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      if (pickedImage != null) {
                        imageCubitCubit.updateProfilePic(pickedImage);
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        Icons.camera_alt_sharp,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ImageProvider<Object>? _getImageProvider() {
    if (imageCubitCubit.profilePic == null) {
      return const AssetImage("assets/person.png");
    } else {
      return FileImage(File(imageCubitCubit.profilePic!.path));
    }
  }
}
