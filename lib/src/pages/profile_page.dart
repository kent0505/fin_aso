import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../blocs/button/button_bloc.dart';
import '../core/database.dart';
import '../core/utils.dart';
import '../widgets/cup_button.dart';
import '../widgets/field_title.dart';
import '../widgets/main_button.dart';
import '../widgets/my_field.dart';
import '../widgets/my_svg.dart';
import '../widgets/title_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();

  XFile _image = XFile('');

  void _onPick() async {
    _image = await _imagePick();
    _controller4.text = _image.path;
    setState(() {});
  }

  Future<XFile> _imagePick() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return XFile('');
    return image;
  }

  void _onSave() async {
    await SharedPreferences.getInstance().then(
      (value) {
        profileName = _controller1.text;
        profileEmail = _controller2.text;
        profileUsername = _controller3.text;
        profileImage = _controller4.text;
        value.setString('profileName', profileName);
        value.setString('profileEmail', profileEmail);
        value.setString('profileUsername', profileUsername);
        value.setString('profileImage', profileImage);
        if (mounted) context.pop();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _controller1.text = profileName;
    _controller2.text = profileEmail;
    _controller3.text = profileUsername;
    _controller4.text = profileImage;
    context.read<ButtonBloc>().add(CheckButton(controllers: const []));
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 10 + getTop(context)),
                const TitleText('Profile'),
                const Spacer(),
                CupButton(
                  onPressed: _onPick,
                  child: Container(
                    height: 210,
                    width: 256,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        width: 4,
                        color: const Color(0xff333333),
                      ),
                    ),
                    child: _controller4.text.isEmpty
                        ? const Center(
                            child: MySvg('assets/pick.svg'),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.file(
                              File(_controller4.text),
                              height: 210,
                              width: 256,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container();
                              },
                            ),
                          ),
                  ),
                ),
                const Spacer(),
                const FieldTitle('Name'),
                const SizedBox(height: 2),
                MyField(
                  controller: _controller1,
                  hintText: 'Name',
                  onChanged: () {},
                ),
                const SizedBox(height: 8),
                const FieldTitle('Username'),
                const SizedBox(height: 2),
                MyField(
                  controller: _controller2,
                  hintText: 'Username',
                  onChanged: () {},
                ),
                const SizedBox(height: 8),
                const FieldTitle('E-mail'),
                const SizedBox(height: 2),
                MyField(
                  controller: _controller3,
                  hintText: 'E-mail',
                  onChanged: () {},
                ),
                const Spacer(),
                MainButton(
                  title: 'Share my profile',
                  onPressed: _onSave,
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
          Positioned(
            top: getTop(context),
            left: 20,
            child: CupButton(
              onPressed: () {
                context.pop();
              },
              child: const MySvg('assets/back.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
