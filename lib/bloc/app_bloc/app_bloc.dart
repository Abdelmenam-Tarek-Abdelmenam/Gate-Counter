import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gate_counter/data/repositories/web_sevices.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>(_startHandler);
    on<SendWifiCredentials>(_sendCredentialsHandler);
  }

  final WebServices _webServices = WebServices();

  void _startHandler(AppEvent event, Emitter emit) {
    print("App Bloc Start");
  }

  Future<void> _sendCredentialsHandler(
      SendWifiCredentials event, Emitter emit) async {
    try {
      bool state =
          await _webServices.sendCredentialsToEsp(event.name, event.pass);
      print(state ? "Ok" : "Not Ok");
    } on DioErrors catch (err) {
      print(err.message);
    }
  }
}
