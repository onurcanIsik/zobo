import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zobo/colors/colors.dart';
import 'package:zobo/core/utils/enums/router.enums.dart';

class HomeBottomBtn extends HookWidget {
  const HomeBottomBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final gameList = ['OKEY - 101'];
    const selectGameTxt = 'Oyun Seç';
    const comingSoonTxt = 'YAKINDA GELİYOR';
    const startGameTxt = 'BAŞLA';
    const letsPlayTxt = 'Oyuna Başla';
    final selectedGame = useState<int>(0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  int localSelectedIndex = selectedGame.value;

                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              selectGameTxt,
                              style: GoogleFonts.poppins(
                                color: bgColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: GridView.builder(
                                itemCount: gameList.length + 1,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                    ),
                                itemBuilder: (context, index) {
                                  if (index == gameList.length) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          color: Colors.grey.shade800,
                                        ),
                                        child: Center(
                                          child: Text(
                                            comingSoonTxt,
                                            style: GoogleFonts.poppins(
                                              color: Colors.grey.shade400,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          localSelectedIndex = index;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: btn2Color,
                                                blurRadius: 4,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                            border: Border.all(
                                              color:
                                                  localSelectedIndex == index
                                                      ? btn1Color
                                                      : Colors.transparent,
                                              width: 3,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            color: cardColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              gameList[index],
                                              style: GoogleFonts.poppins(
                                                color: btn2Color,
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                selectedGame.value = localSelectedIndex;
                                if (selectedGame.value == 0) {
                                  context.router.pushPath(
                                    RouteEnums.okeyPath.value,
                                  );
                                }
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: btn1Color,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                startGameTxt,
                                style: GoogleFonts.poppins(
                                  color: txtColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: btn1Color,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              letsPlayTxt,
              style: GoogleFonts.poppins(
                color: txtColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
