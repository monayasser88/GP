import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/components/custom_container_in_profile.dart';
import 'package:gp_project/components/custom_edit_photo.dart';
import 'package:gp_project/components/custom_title_in_profile.dart';
import 'package:gp_project/components/logout_pop_up.dart';
import 'package:gp_project/components/update_pop_up.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/cubit/image_cubit_cubit.dart';
import 'package:gp_project/cubit/profile_cubit.dart';
import 'package:gp_project/pages/change_password.dart';
import 'package:gp_project/pages/update_email.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  void showCustomPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const LogOutPopUp();
      },
    );
  }
  @override
  void initState() {
    super.initState();
    dio = Dio();
    context.read<ProfileCubit>().getUserProfile(dio);
  }
  final ImageCubitCubit imageCubit = ImageCubitCubit();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
    late Dio dio;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is ProfileLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ProfileLoaded) {
        //final profile = state.profile;
        firstNameController.text = state.profile.firstName ?? '';
        lastNameController.text = state.profile.lastName ?? '';
        cityController.text = state.profile.city ?? '';
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 630,
              child: Column(
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  CustomAppBar(
                    title: 'Profile',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 150,
                    child: BlocProvider(
                      create: (context) => ImageCubitCubit(),
                      child: PickImageWidget(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTitle(
                    titleProfile: 'First name',
                    onTap: () {
                      showUpdateDialog(context, 'Update First Name',
                          'Enter First Name', firstNameController, () {}
                          //   () {
                          // final updatedLastName = lastNameController.text;
                          // BlocProvider.of<ProfileCubit>(context)
                          //     .updateLastName(updatedLastName);
                          //}
                          );
                    },
                    //userInfo: state.profile.firstName.toString()
                    userInfo: state.profile.firstName ??'',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTitle(
                    titleProfile: 'Last name',
                    onTap: () {
                      showUpdateDialog(context, 'Update Last Name',
                          'Enter Last Name', lastNameController, () {
                        // final updatedLastName = lastNameController.text;
                        // BlocProvider.of<ProfileCubit>(context)
                        //     .updateLastName(updatedLastName);
                      });
                    },
                    //userInfo: state.profile.lastName.toString()
                    userInfo: state.profile.lastName ??'',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Flexible(
                    child: Divider(
                      thickness: 1,
                      color: Color(0xff92929D),
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTitle(
                    titleProfile: 'Email',
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const UpdateEmail();
                      }));
                    },
                    userInfo: state.profile.email!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTitle(
                    titleProfile: 'City',
                    onTap: () {
                      showUpdateDialog(
                          context, 'Update City', 'Enter City', cityController,
                          () {
                        // final updatedCity = cityController.text;
                        // BlocProvider.of<ProfileCubit>(context)
                        //     .updateCity(updatedCity);
                      });
                    },
                    //userInfo: state.profile.city.toString(),
                    userInfo: 'cairo',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Flexible(
                    child: Divider(
                      thickness: 1,
                      color: Color(0xff92929D),
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ContainerProfile(
                    forwardName: 'Change Password',
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ChangePassword();
                      }));
                    },
                  ),
                  ContainerProfile(
                    forwardName: 'Log out',
                    color: kPrimaryColor,
                    onTap: () {
                      showCustomPopup(context);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      }
      if(state is ProfileError){
          ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errMassage)));
      }
      return Container();
    });

    //}
    //return Container();
    // },
    // );
  }
}
