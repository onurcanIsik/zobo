import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zobo/colors/colors.dart';
import 'package:zobo/extension/extension.dart';

class AddUsersWidget extends StatefulWidget {
  final TextEditingController usersForm;
  final Function() addUsers;
  final ValueNotifier<List<String>> users;

  const AddUsersWidget({
    super.key,
    required this.usersForm,
    required this.addUsers,
    required this.users,
  });

  @override
  State<AddUsersWidget> createState() => _AddUsersWidgetState();
}

class _AddUsersWidgetState extends State<AddUsersWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: context.dynamicWidth(0.6),
              child: TextFormField(
                controller: widget.usersForm,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Lütfen oyuncu adı giriniz';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: bgColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: btn2Color, width: 2),
                  ),
                  hintText: 'Oyuncu adı gir',
                  hintStyle: GoogleFonts.poppins(color: txtColor),
                ),
                style: GoogleFonts.poppins(color: txtColor),
              ),
            ),
          ),
          IconButton.filled(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (widget.users.value.length >= 4) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('En fazla 4 oyuncu ekleyebilirsiniz'),
                    ),
                  );
                  return;
                }
                widget.addUsers();
                widget.usersForm.clear();
              }
            },
            icon: Icon(Icons.add, color: txtColor),
          ),
        ],
      ),
    );
  }
}
