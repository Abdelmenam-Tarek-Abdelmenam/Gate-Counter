import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/data_sources/pref_repository.dart';

part 'constants_event.dart';
part 'constants_state.dart';

class ConstantsBloc extends Bloc<ConstantsEvent, ConstantsState> {
  ConstantsBloc() : super(ConstantsState.initial()) {
    on<ChangeNameEvent>(_changeNameHandler);
    on<ChangeAddressEvent>(_changeAddressHandler);
    on<ChangePhoneEvent>(_changePhoneHandler);
  }

  void _changeNameHandler(ChangeNameEvent event, Emitter emit) =>
      emit(state.copyWith(placeName: event.newValue));
  void _changeAddressHandler(ChangeAddressEvent event, Emitter emit) =>
      emit(state.copyWith(placeAddress: event.newValue));
  void _changePhoneHandler(ChangePhoneEvent event, Emitter emit) =>
      emit(state.copyWith(placePhone: event.newValue));
}
