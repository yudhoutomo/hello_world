import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hello_world/core/data/datasource/api/user_api.dart';
import 'package:hello_world/core/data/model/flight/flight.dart';
import 'package:injectable/injectable.dart';

import '../../../core/utils/status.dart';

part 'flight_state.dart';

@Injectable()
class FlightCubit extends Cubit<FlightState> {
  FlightCubit(this._api) : super(FlightInitial());

  final UserApi _api;
  var data = <Flight>[];

  void getFlight() async {
    emit(FlightInitialState(status: Status.loading));
    try {
      final response = await _api.getFlight();
      emit(FlightInitialState(status: Status.success, data: response.data));
      data = response.data;
    } catch (e) {
      emit(FlightInitialState(status: Status.error));
    }
  }

  void filter(String query) {
    final result = data.where((element) => element.airportName.contains(query));
    emit(FlightInitialState(status: Status.success, data: result.toList()));
  }
}
