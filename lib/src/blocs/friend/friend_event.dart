part of 'friend_bloc.dart';

@immutable
sealed class FriendEvent {}

class GetFriends extends FriendEvent {}

class AddFriend extends FriendEvent {
  AddFriend({required this.friend});
  final Friend friend;
}

class EditFriend extends FriendEvent {
  EditFriend({required this.friend});
  final Friend friend;
}

class DeleteFriend extends FriendEvent {
  DeleteFriend({required this.friend});
  final Friend friend;
}
