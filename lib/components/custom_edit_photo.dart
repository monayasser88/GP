import 'dart:io';

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

  @override
  void initState() {
    super.initState();
    profileCubit = context.read<ProfileCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      if (state is UploadPicture) {
        // Show loading indicator or any UI updates during upload
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
                      final pickedImage = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      if (pickedImage != null) {
                        profileCubit.updateProfilePic(pickedImage);
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
