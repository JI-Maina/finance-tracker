import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:finance_tracker/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:finance_tracker/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}
