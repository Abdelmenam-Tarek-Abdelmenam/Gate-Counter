part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class SendWifiCredentials extends AppEvent {
  final String name;
  final String pass;
  const SendWifiCredentials(this.name, this.pass);

  @override
  List<Object?> get props => [name, pass];
}
