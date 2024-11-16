part of 'button_bloc.dart';

@immutable
sealed class ButtonEvent {}

class CheckButton extends ButtonEvent {
  CheckButton({required this.controllers});
  final List<String> controllers;
}
