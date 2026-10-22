import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/core/di/service_locator.dart';
import 'package:shopping/core/widgets/Buttons/black_btn.dart';
import 'package:shopping/core/widgets/text_filed.dart';
import 'package:shopping/features/profile/domain/entities/profile_entity.dart';
import 'package:shopping/features/profile/presentation/view_model/profile_cubit.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late TextEditingController name;

  late TextEditingController address;

  late TextEditingController phone;

  String? image;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<ProfileCubit>()..intent(GetUserData()),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listenWhen: (previous, current) => current is ProfileError,
        listener: (context, state) {
          if (state is ProfileError) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 3),
                  showCloseIcon: true,
                  content: Text(
                    state.error,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  backgroundColor: Colors.red,
                  elevation: 2,
                ),
              );
          }
        },
        builder: (context, state) {
          if (state is ProfileSuccess) {
            final ProfileEntity data = state.data;
            name.text = data.name;
            phone.text = data.phone;
            address.text = data.address;
            final cubit = context.read<ProfileCubit>();
            final selectedImage = cubit.image;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Center(
                      child: ClipOval(
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                constraints: const BoxConstraints(
                                  maxHeight: 200,
                                  minWidth: double.infinity,
                                ),
                                builder: (sheetContext) {
                                  return SafeArea(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: const Icon(Icons.camera_alt),
                                          title: const Text("Camera"),
                                          onTap: () {
                                            Navigator.pop(sheetContext);
                                            context.read<ProfileCubit>().intent(
                                              CaptureProfileImage(),
                                            );
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(
                                            Icons.photo_library,
                                          ),
                                          title: const Text("Gallery"),
                                          onTap: () {
                                            Navigator.pop(sheetContext);
                                            context.read<ProfileCubit>().intent(
                                              PickProfileImage(),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: selectedImage != null
                                      ? Image.file(
                                          File(selectedImage.path),
                                          fit: BoxFit.cover,
                                        )
                                      : CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: data.image,
                                          placeholder: (context, url) =>
                                              const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                      color: Colors.amber,
                                                    ),
                                              ),
                                          errorWidget: (context, url, error) =>
                                              Center(
                                                child: Image.asset(
                                                  "assets/images/error.png",
                                                  width: 32,
                                                  height: 32,
                                                ),
                                              ),
                                        ),
                                ),
                                Positioned(
                                  right: 4,
                                  bottom: -2,
                                  child: Image.asset("assets/icons/edit.png"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    SizedBox(
                      width: 350,
                      child: Text(
                        "Name",
                        style: Theme.of(context).primaryTextTheme.bodyMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    TextFiledStyle(isSecure: false, controller: name),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: 350,
                      child: Text(
                        "Address",
                        style: Theme.of(context).primaryTextTheme.bodyMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    TextFiledStyle(isSecure: false, controller: address),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: 350,
                      child: Text(
                        "Phone",
                        style: Theme.of(context).primaryTextTheme.bodyMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    TextFiledStyle(
                      hint: "Phone",
                      isSecure: false,
                      controller: phone,
                    ),

                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Center(
                        child: BlackBtn(
                          text: "Submit",
                          onPressed: () async {
                            context.read<ProfileCubit>().submitData(
                              ProfileEntity(
                                address: address.text,
                                image: image ?? data.image,
                                name: name.text,
                                phone: phone.text,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            );
          }

          if (state is ProfileError) {
            return Center(
              child: SvgPicture.asset(
                "assets/svg/error.svg",
                width: 168,
                height: 168,
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(color: Colors.amberAccent),
          );
        },
      ),
    );
  }
}
