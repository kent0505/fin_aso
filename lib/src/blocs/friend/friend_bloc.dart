import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/database.dart';
import '../../models/friend.dart';

part 'friend_event.dart';
part 'friend_state.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  FriendBloc() : super(FriendInitial()) {
    on<FriendEvent>(
      (event, emit) => switch (event) {
        GetFriends() => _get(event, emit),
        AddFriend() => _add(event, emit),
        EditFriend() => _edit(event, emit),
        DeleteFriend() => _delete(event, emit),
      },
    );
  }
  void _get(GetFriends event, Emitter<FriendState> emit) async {
    try {
      await getModels();
      emit(FriendsLoaded(friends: friendsList));
    } on Object catch (_) {
      emit(FriendFailure());
    }
  }

  void _add(AddFriend event, Emitter<FriendState> emit) async {
    try {
      friendsList.add(event.friend);
      await updateFriends();
      emit(FriendsLoaded(friends: friendsList));
    } on Object catch (_) {
      emit(FriendFailure());
    }
  }

  void _edit(EditFriend event, Emitter<FriendState> emit) async {
    try {
      for (Friend friend in friendsList) {
        if (identical(friend.id, event.friend.id)) {
          friend.name = event.friend.name;
          friend.image = event.friend.image;
        }
      }
      await updateFriends();
      emit(FriendsLoaded(friends: friendsList));
    } on Object catch (_) {
      emit(FriendFailure());
    }
  }

  void _delete(DeleteFriend event, Emitter<FriendState> emit) async {
    try {
      friendsList.removeWhere((friend) => identical(friend, event.friend));
      await updateFriends();
      emit(FriendsLoaded(friends: friendsList));
    } on Object catch (_) {
      emit(FriendFailure());
    }
  }
}
