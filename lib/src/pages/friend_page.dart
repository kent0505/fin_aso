import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../blocs/button/button_bloc.dart';
import '../blocs/friend/friend_bloc.dart';
import '../core/utils.dart';
import '../models/friend.dart';
import '../widgets/cup_button.dart';
import '../widgets/field_title.dart';
import '../widgets/main_button.dart';
import '../widgets/my_field.dart';
import '../widgets/my_svg.dart';
import '../widgets/title_text.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({
    super.key,
    required this.friend,
  });

  final Friend friend;

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

  XFile _image = XFile('');

  void _onPick() async {
    _image = await _imagePick();
    _controller2.text = _image.path;
    _onCheck();
  }

  Future<XFile> _imagePick() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return XFile('');
    return image;
  }

  void _onCheck() {
    context.read<ButtonBloc>().add(CheckButton(
          controllers: [
            _controller1.text,
            _controller2.text,
          ],
        ));
  }

  void _onSave() async {
    context.read<FriendBloc>().add(
          widget.friend.name.isEmpty
              ? AddFriend(
                  friend: Friend(
                    id: currentTimestamp(),
                    name: _controller1.text,
                    image: _controller2.text,
                  ),
                )
              : EditFriend(
                  friend: Friend(
                    id: widget.friend.id,
                    name: _controller1.text,
                    image: _controller2.text,
                  ),
                ),
        );
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    if (widget.friend.name.isNotEmpty) {
      _controller1.text = widget.friend.name;
      _controller2.text = widget.friend.image;
    }
    _onCheck();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
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
                const TitleText('Friend'),
                const SizedBox(height: 48),
                BlocBuilder<ButtonBloc, ButtonState>(
                  builder: (context, state) {
                    return CupButton(
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
                        child: _controller2.text.isEmpty
                            ? const Center(
                                child: MySvg('assets/pick.svg'),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.file(
                                  File(_controller2.text),
                                  height: 210,
                                  width: 256,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container();
                                  },
                                ),
                              ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 48),
                const FieldTitle('Name'),
                const SizedBox(height: 2),
                MyField(
                  controller: _controller1,
                  hintText: 'Name',
                  onChanged: _onCheck,
                ),
                const Spacer(),
                MainButton(
                  title:
                      widget.friend.name.isEmpty ? 'Add friend' : 'Edit friend',
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
