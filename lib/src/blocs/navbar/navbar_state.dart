part of 'navbar_bloc.dart';

@immutable
sealed class NavbarState {}

final class NavbarInitial extends NavbarState {}

final class NavbarPiechart extends NavbarState {}

final class NavbarLesson extends NavbarState {}

final class NavbarProfile extends NavbarState {}
