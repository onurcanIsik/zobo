// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:zobo/colors/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zobo/core/components/okeyWidgets/home_bottom_btn.dart';
import 'package:zobo/core/provider/okeyRiverpod/OkeyNotifier.dart';
import 'package:zobo/core/provider/okeyRiverpod/okey.provider.dart';
import 'package:zobo/core/provider/okeyRiverpod/okey.state.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final okeyNotifierProvider = StateNotifierProvider<OkeyNotifier, OkeyState>((
    ref,
  ) {
    final service = ref.read(okeyServiceProvider);
    return OkeyNotifier(service);
  });

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(okeyNotifierProvider.notifier).getAllGames(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(okeyNotifierProvider);
    final notifier = ref.read(okeyNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/zobo_logo.png', scale: 5)
                    .animate(onPlay: (controller) => controller.repeat())
                    .shimmer(duration: 4.seconds),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Gap(20),
                Text(
                  'Geçmiş',
                  style: GoogleFonts.poppins(
                    color: txtColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(20),
                Text(
                  DateTime.now().toString().substring(0, 10),
                  style: GoogleFonts.poppins(
                    color: txtColor.withOpacity(0.7),
                    fontSize: 16,
                  ),
                ),
                const Gap(20),
              ],
            ),
            Divider(
              color: btn2Color,
              thickness: 1,
              height: 20,
              indent: 20,
              endIndent: 20,
            ),
            Expanded(
              child:
                  state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                        itemCount: state.games.length,
                        itemBuilder: (context, index) {
                          final game = state.games[index];
                          return Card(
                            color: cardColor,
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: ListTile(
                              title: Text(
                                _buildPlayerNames(game.userList),
                                style: GoogleFonts.poppins(color: txtColor),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: _buildScoreText(
                                        game.pointOne,
                                        game.pointTwo,
                                      ),
                                      style: GoogleFonts.poppins(fontSize: 14),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Tarih: ${game.date}',
                                    style: GoogleFonts.poppins(
                                      color: txtColor.withOpacity(0.7),
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                onPressed: () async {
                                  await notifier.deleteBoxId(game.id ?? 0);
                                  await notifier.getAllGames();
                                },
                                icon: Icon(Icons.delete, color: btn2Color),
                              ),
                            ),
                          );
                        },
                      ),
            ),
            HomeBottomBtn(),
          ],
        ),
      ),
    );
  }

  String _buildPlayerNames(List? players) {
    if (players == null || players.length < 4) return 'Bilinmeyen Oyuncular';
    final teamA = '${players[0]} ve ${players[3]}';
    final teamB = '${players[1]} ve ${players[2]}';
    return '$teamA VS $teamB';
  }

  List<TextSpan> _buildScoreText(String? p1, String? p2) {
    final pointOne = int.tryParse(p1 ?? '') ?? 0;
    final pointTwo = int.tryParse(p2 ?? '') ?? 0;

    final isTeamOneLosing = pointOne < pointTwo;
    final isTeamTwoLosing = pointTwo < pointOne;

    return [
      TextSpan(
        text: 'Puanlar: ',
        style: TextStyle(color: txtColor.withOpacity(0.7)),
      ),
      TextSpan(
        text: '$pointOne',
        style: TextStyle(
          color: isTeamOneLosing ? Colors.green : txtColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      const TextSpan(text: ' - '),
      TextSpan(
        text: '$pointTwo',
        style: TextStyle(
          color: isTeamTwoLosing ? Colors.green : txtColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];
  }
}
