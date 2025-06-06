import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zobo/core/services/okeyService/okey.service.dart';

final okeyServiceProvider = Provider<OkeyService>((ref) {
  return OkeyService();
});
