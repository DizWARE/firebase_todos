import 'package:firebase_todo/blocs/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository userRepository = FirebaseUserRepository();
  runApp(
    BlocProvider(
      builder: (context) => AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: Text("")
    )
  );
}