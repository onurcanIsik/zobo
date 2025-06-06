import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:zobo/core/model/okey.model.dart';
import 'package:zobo/core/services/okeyService/IOkey.service.dart';

class OkeyService implements IOkeyService {
  var box = Hive.box('okeyBox');
  @override
  Future<Either<String, Unit>> finishGame(OkeyModel model) async {
    try {
      final all = box.values.toList();

      int newId = 1;
      if (all.isNotEmpty) {
        final lastId = all
            .map((e) => OkeyModel.fromJson(Map<String, dynamic>.from(e as Map)))
            .map((model) => model.id ?? 0)
            .fold<int>(0, (prev, curr) => curr > prev ? curr : prev);
        newId = lastId + 1;
      }

      model.id = newId;

      await box.put(newId, model.toJson());

      return Right(unit);
    } catch (ex) {
      return Left('Okey oyunu bitirilemedi: ${ex.toString()}');
    }
  }

  @override
  Future<Either<String, List<OkeyModel>>> getAllGames() async {
    try {
      final all = box.values.toList();

      final games =
          all
              .map(
                (e) => OkeyModel.fromJson(Map<String, dynamic>.from(e as Map)),
              )
              .toList();

      return Right(games);
    } catch (ex) {
      return Left('Okey oyunları alınamadı: ${ex.toString()}');
    }
  }

  @override
  Future<Either<String, Unit>> deleteBoxId(int boxId) async {
    try {
      if (box.isEmpty) {
        return Right(unit);
      }

      if (box.containsKey(boxId)) {
        await box.delete(boxId);
      }

      return Right(unit);
    } catch (ex) {
      return Left('Okey kutusu silinemedi: ${ex.toString()}');
    }
  }
}
