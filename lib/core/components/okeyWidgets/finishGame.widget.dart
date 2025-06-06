// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zobo/colors/colors.dart';
import 'package:zobo/core/model/okey.model.dart';
import 'package:zobo/core/provider/okeyRiverpod/OkeyNotifier.dart';
import 'package:zobo/core/provider/okeyRiverpod/okey.provider.dart';
import 'package:zobo/core/provider/okeyRiverpod/okey.state.dart';
import 'package:zobo/core/utils/enums/router.enums.dart';

class FinishGameBtn extends ConsumerWidget {
  final OkeyModel okeyModel;

  FinishGameBtn(this.okeyModel, {super.key});

  final okeyNotifierProvider = StateNotifierProvider<OkeyNotifier, OkeyState>((
    ref,
  ) {
    final service = ref.read(okeyServiceProvider);
    return OkeyNotifier(service);
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(okeyNotifierProvider);
    final notifier = ref.read(okeyNotifierProvider.notifier);

    return Column(
      children: [
        if (state.isLoading)
          const CircularProgressIndicator()
        else
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: btn2Color,
              foregroundColor: txtColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () async {
              await notifier.finishGame(okeyModel);
              await notifier.getAllGames();
              context.router.replacePath(RouteEnums.homePath.value);
            },
            child: Text(
              "Oyunu Bitir",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        if (state.error != null)
          Text(state.error!, style: const TextStyle(color: Colors.red)),
        if (state.isSuccess)
          const Text(
            "Oyun başarıyla kaydedildi!",
            style: TextStyle(color: Colors.green),
          ),
      ],
    );
  }
}
