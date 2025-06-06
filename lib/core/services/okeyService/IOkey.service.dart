import 'package:dartz/dartz.dart';
import 'package:zobo/core/model/okey.model.dart';

abstract class IOkeyService {
  Future<Either<String, Unit>> finishGame(OkeyModel model);
  Future<Either<String, List<OkeyModel>>> getAllGames();
  Future<Either<String, Unit>> deleteBoxId(int boxId);
}
