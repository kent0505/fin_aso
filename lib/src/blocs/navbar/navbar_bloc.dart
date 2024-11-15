import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitial()) {
    on<NavbarEvent>(
      (event, emit) => switch (event) {
        ChangePage() => _change(event, emit),
      },
    );
  }

  void _change(ChangePage event, Emitter<NavbarState> emit) {
    if (identical(event.index, 1)) emit(NavbarInitial());
    if (identical(event.index, 2)) emit(NavbarPiechart());
    if (identical(event.index, 3)) emit(NavbarLesson());
    if (identical(event.index, 4)) emit(NavbarProfile());
  }
}
