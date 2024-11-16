import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/database.dart';
import '../core/fonts.dart';
import '../core/utils.dart';
import '../widgets/cup_button.dart';
import '../widgets/field_title.dart';
import '../widgets/main_button.dart';
import '../widgets/my_field.dart';
import '../widgets/my_svg.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
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

  int index = 1;

  String _title() {
    if (index == 1) return 'Application to control your budget, save money';
    return 'Enter your details';
  }

  String _des() {
    if (index == 1) {
      return 'Use all the functions of the application, get visual statistics, share your success with friends';
    }
    if (index == 2) {
      return 'The data is needed so that other users can find out about you.';
    }
    return 'Add your photo to make it easier for other users to find you';
  }

  void _skip() async {
    SharedPreferences.getInstance().then(
      (value) {
        onboard = false;
        value.setBool('onboard', onboard);
      },
    );
    context.go('/home');
  }

  void onNext() async {
    if (index == 3) {
      SharedPreferences.getInstance().then(
        (value) {
          onboard = false;
          profileName = _controller1.text;
          profileEmail = _controller2.text;
          profileUsername = _controller3.text;
          profileImage = _controller4.text;
          value.setBool('onboard', onboard);
          value.setString('profileName', profileName);
          value.setString('profileEmail', profileEmail);
          value.setString('profileUsername', profileUsername);
          value.setString('profileImage', profileImage);
        },
      );
      context.go('/home');
    } else {
      setState(() {
        index++;
      });
    }
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
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 46 + getTop(context)),
              if (index != 1)
                Row(
                  children: [
                    const Spacer(),
                    CupButton(
                      onPressed: _skip,
                      minSize: 20,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 12,
                          fontFamily: Fonts.w700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(width: 45),
                  ],
                ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Text(
                  _title(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff333333),
                    fontSize: 30,
                    fontFamily: Fonts.w700,
                  ),
                ),
              ),
              const Spacer(),
              if (index == 2) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
              ] else if (index == 3)
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Text(
                  _des(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff333333),
                    fontSize: 18,
                    fontFamily: Fonts.w400,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: MainButton(
                  title: index == 1 ? 'Start' : 'Next',
                  onPressed: onNext,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
          IgnorePointer(
            ignoring: true,
            child: Align(
              alignment: Alignment.center,
              child: MySvg('assets/o$index.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
