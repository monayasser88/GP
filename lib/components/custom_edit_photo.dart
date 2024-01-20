import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/cubit/image_cubit_cubit.dart';

class CustomEditPhoto extends StatefulWidget {
  final ImageCubitCubit imageCubit;

  const CustomEditPhoto({super.key, required this.imageCubit});

  @override
  State<CustomEditPhoto> createState() => _CustomEditPhotoState();
}

class _CustomEditPhotoState extends State<CustomEditPhoto> {
  @override
  void dispose() {
    final imageCubit = widget.imageCubit;
    imageCubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final imageCubit = context.watch<ImageCubitCubit>();
        return Stack(
          children: [
            if (imageCubit.state is ImageLoaded)
              SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child:
                    Image(image: AssetImage('assets/logo3.jpg')),
                  //Image.network((imageCubit.state as ImageLoaded).imageUrl),
                ),
              ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kPrimaryColor,
                ),
                child: IconButton(
                  onPressed: () {
                    imageCubit.pickImage().then((imageFile) {
                      if (imageFile != null) {
                        imageCubit
                            .uploadImage(imageFile as File)
                            .then((imageUrl) {
                          imageCubit.setImage(imageUrl);
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Error uploading image: $error'),
                          ));
                        });
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      }
  }

