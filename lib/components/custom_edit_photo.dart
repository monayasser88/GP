import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/cubit/profile_cubit.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatefulWidget {
  const PickImageWidget({Key? key}) : super(key: key);

  @override
  _PickImageWidgetState createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  late ProfileCubit profileCubit;
  late Dio dio;
  @override
  void initState() {
    super.initState();
    dio = Dio();
    profileCubit = context.read<ProfileCubit>();
  }

  bool isImagePickerActive = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      if (state is UploadPicture) {
        return CircularProgressIndicator();
      } else if (state is ProfileLoaded) {
        return SizedBox(
          width: 120,
          height: 120,
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage: NetworkImage(state.profile.profilePic ?? ''),
            child: Stack(
              children: [
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () async {
                      if (!isImagePickerActive) {
                        isImagePickerActive =
                            true; // Set flag to indicate image picker is active
                        final pickedImage = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                        );
                        if (pickedImage != null) {
                          await profileCubit.UploadImageToApi(pickedImage);
                        }
                      }
                      await Future.delayed(Duration(seconds: 2));
                      setState(() {
                        profileCubit.getUserProfile(dio);
                      });
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
      }
      return Container();
    });
  }

  ImageProvider<Object>? _getImageProvider() {
    if (profileCubit.profilePic == null) {
      return const AssetImage('assets/person.png');
    } else {
      return FileImage(File(profileCubit.profilePic!.path));
    }
  }
}
