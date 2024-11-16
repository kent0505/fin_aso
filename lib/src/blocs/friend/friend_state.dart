part of 'friend_bloc.dart';

@immutable
sealed class FriendState {}

final class FriendInitial extends FriendState {}

final class FriendsLoaded extends FriendState {
  FriendsLoaded({required this.friends});

  final List<Friend> friends;
}

final class FriendFailure extends FriendState {}
