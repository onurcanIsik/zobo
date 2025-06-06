import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zobo/colors/colors.dart';
import 'package:zobo/extension/extension.dart';

class AddPointWidget extends StatefulWidget {
  final TextEditingController txtFormOne;
  final TextEditingController txtFormTwo;
  final Function(int, int) onAddPoint;

  const AddPointWidget({
    super.key,
    required this.txtFormOne,
    required this.txtFormTwo,
    required this.onAddPoint,
  });

  @override
  State<AddPointWidget> createState() => _AddPointWidgetState();
}

class _AddPointWidgetState extends State<AddPointWidget> {
  final formKey = GlobalKey<FormState>();

  void updateTextController(TextEditingController controller, int value) {
    final current = int.tryParse(controller.text) ?? 0;
    controller.text = (current + value).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: context.dynamicWidth(0.33),
                child: TextFormField(
                  controller: widget.txtFormOne,
                  keyboardType: TextInputType.number,
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Puan giriniz'
                              : null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: bgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: btn2Color, width: 2),
                    ),
                    hintText: 'P1 Puan',
                    hintStyle: GoogleFonts.poppins(color: txtColor),
                  ),
                  style: GoogleFonts.poppins(color: txtColor),
                ),
              ),
              const Gap(10),
              // Ekle butonu
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: btn1Color,
                  shadowColor: btn2Color,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final p1 = int.tryParse(widget.txtFormOne.text) ?? 0;
                    final p2 = int.tryParse(widget.txtFormTwo.text) ?? 0;
                    widget.onAddPoint(p1, p2);
                    widget.txtFormOne.clear();
                    widget.txtFormTwo.clear();
                  }
                },
                child: Text(
                  'EKLE',
                  style: GoogleFonts.poppins(
                    color: txtColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Gap(10),
              // Oyuncu 2 puan
              SizedBox(
                width: context.dynamicWidth(0.33),
                child: TextFormField(
                  controller: widget.txtFormTwo,
                  keyboardType: TextInputType.number,
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Puan giriniz'
                              : null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: bgColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: btn2Color, width: 2),
                    ),
                    hintText: 'P2 Puan',
                    hintStyle: GoogleFonts.poppins(color: txtColor),
                  ),
                  style: GoogleFonts.poppins(color: txtColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
