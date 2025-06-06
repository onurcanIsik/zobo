import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zobo/core/model/okey.model.dart';
import 'package:zobo/core/services/okeyService/okey.service.dart';
import 'okey.state.dart';

class OkeyNotifier extends StateNotifier<OkeyState> {
  final OkeyService _service;

  OkeyNotifier(this._service) : super(OkeyState());

  Future<void> finishGame(OkeyModel model) async {
    state = state.copyWith(isLoading: true, error: null, isSuccess: false);

    final result = await _service.finishGame(model);

    result.fold(
      (err) => state = state.copyWith(isLoading: false, error: err),
      (_) => state = state.copyWith(isLoading: false, isSuccess: true),
    );
  }

  Future<void> getAllGames() async {
    state = state.copyWith(isLoading: true);

    final result = await _service.getAllGames();

    result.fold(
      (err) => state = state.copyWith(isLoading: false, error: err),
      (list) => state = state.copyWith(isLoading: false, games: list),
    );
  }

  Future<void> deleteBoxId(int boxId) async {
    state = state.copyWith(isLoading: true, error: null, isSuccess: false);

    final result = await _service.deleteBoxId(boxId);

    result.fold(
      (err) => state = state.copyWith(isLoading: false, error: err),
      (_) => state = state.copyWith(isLoading: false, isSuccess: true),
    );
  }

  void reset() => state = OkeyState();
}
