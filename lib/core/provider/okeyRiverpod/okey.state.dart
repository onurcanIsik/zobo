import 'package:zobo/core/model/okey.model.dart';

class OkeyState {
  final bool isLoading;
  final String? error;
  final bool isSuccess;
  final List<OkeyModel> games;

  OkeyState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
    this.games = const [],
  });

  OkeyState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
    List<OkeyModel>? games,
  }) {
    return OkeyState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
      games: games ?? this.games,
    );
  }
}
