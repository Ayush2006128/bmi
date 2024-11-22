import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bmi_tile_event.dart';
part 'bmi_tile_state.dart';

class BmiTileBloc extends Bloc<BmiTileEvent, BmiTileState> {
  BmiTileBloc() : super(BmiTileInitial()) {
    on<BmiTileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
