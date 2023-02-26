import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('change = ${change}');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('Close = ${bloc}');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('Create = ${bloc}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('Error = ${bloc}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('Event = ${bloc}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('Transition = ${bloc}');
  }
}
