import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/friend/friend_bloc.dart';
import '../core/fonts.dart';
import '../models/friend.dart';
import 'cup_button.dart';

class FriendsWidget extends StatelessWidget {
  const FriendsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BlocBuilder<FriendBloc, FriendState>(
        builder: (context, state) {
          if (state is FriendsLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.only(left: 24, right: 2),
              scrollDirection: Axis.horizontal,
              itemCount: state.friends.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) return const _AddFriend();

                return _FriendCard(friend: state.friends[index - 1]);
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}

class _AddFriend extends StatelessWidget {
  const _AddFriend();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22),
      child: Column(
        children: [
          CupButton(
            onPressed: () {
              context.push(
                '/friend',
                extra: Friend(
                  id: 0,
                  name: '',
                  image: '',
                ),
              );
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff333333),
              ),
              child: DottedBorder(
                dashPattern: const [2, 2],
                color: Colors.white,
                borderType: BorderType.Circle,
                strokeWidth: 1,
                padding: const EdgeInsets.all(0),
                child: const Center(
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add',
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: 12,
              fontFamily: Fonts.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _FriendCard extends StatelessWidget {
  const _FriendCard({required this.friend});

  final Friend friend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22),
      child: Column(
        children: [
          CupButton(
            onPressed: () {
              context.push('/friend', extra: friend);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff333333),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.file(
                  File(friend.image),
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container();
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            friend.name,
            style: const TextStyle(
              color: Color(0xff333333),
              fontSize: 8,
              fontFamily: Fonts.w500,
            ),
          ),
        ],
      ),
    );
  }
}
