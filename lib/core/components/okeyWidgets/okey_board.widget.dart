import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zobo/colors/colors.dart';

class OkeyBoardWidget extends StatelessWidget {
  final List<String> players;

  const OkeyBoardWidget({super.key, required this.players});

  String getPlayerName(int index) {
    if (index < players.length) {
      return players[index];
    }
    return 'Oyuncu ${index + 1}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ÜST OYUNCU
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            getPlayerName(0),
            style: GoogleFonts.poppins(
              color: txtColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SOL OYUNCU
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  getPlayerName(1),
                  style: GoogleFonts.poppins(
                    color: txtColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // MASA GÖRSELİ
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/okey_masa.png',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),

            // SAĞ OYUNCU
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: RotatedBox(
                quarterTurns: 1,
                child: Text(
                  getPlayerName(2),
                  style: GoogleFonts.poppins(
                    color: txtColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),

        // ALT OYUNCU
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            getPlayerName(3),
            style: GoogleFonts.poppins(
              color: txtColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
