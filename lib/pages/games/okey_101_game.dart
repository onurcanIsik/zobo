import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zobo/colors/colors.dart';
import 'package:zobo/core/components/okeyWidgets/add_btn_point.widget.dart';
import 'package:zobo/core/components/okeyWidgets/add_users.widget.dart';
import 'package:zobo/core/components/okeyWidgets/finishGame.widget.dart';
import 'package:zobo/core/components/okeyWidgets/okey_board.widget.dart';
import 'package:zobo/core/components/okeyWidgets/okey_container.widget.dart';
import 'package:zobo/core/model/okey.model.dart';
import 'package:zobo/extension/extension.dart';
import 'package:intl/intl.dart';

@RoutePage()
class OkeyGame101 extends HookWidget {
  const OkeyGame101({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedValueOne = useState<int>(0);
    final selectedValueTwo = useState<int>(0);
    final txtFormOne = useTextEditingController();
    final txtFormTwo = useTextEditingController();
    final users = useState<List<String>>([]);
    final usersForm = useTextEditingController();
    final formattedDate = DateFormat(
      'dd.MM.yyyy – HH:mm',
    ).format(DateTime.now());

    void addUser() {
      final name = usersForm.text.trim();
      if (name.isNotEmpty && users.value.length < 4) {
        users.value = [...users.value, name];
      }
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text('Okey 101', style: GoogleFonts.poppins(color: txtColor)),
        centerTitle: true,
        iconTheme: IconThemeData(color: txtColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OkeyContainerWidget(score: selectedValueOne),
                OkeyContainerWidget(score: selectedValueTwo),
              ],
            ),
            const Gap(30),
            OkeyBoardWidget(players: users.value),
            const Gap(30),
            AddUsersWidget(
              usersForm: usersForm,
              users: users,
              addUsers: addUser,
            ),
            const Gap(10),
            AddPointWidget(
              txtFormOne: txtFormOne,
              txtFormTwo: txtFormTwo,
              onAddPoint: (int one, int two) {
                selectedValueOne.value += one;
                selectedValueTwo.value += two;
              },
            ),
            Gap(context.dynamicHeight(0.1)),
            FinishGameBtn(
              OkeyModel(
                date: formattedDate,
                userList: users.value,
                pointOne: selectedValueOne.value.toString(),
                pointTwo: selectedValueTwo.value.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
