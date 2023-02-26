// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/constants.dart';

class CustomButton extends StatelessWidget {
  String Titel;
  VoidCallback? onTap;
  bool? isLoading = false;
  CustomButton({super.key, required this.Titel, this.onTap, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
        width: double.infinity,
        height: 60,
        child: Center(
            child: isLoading == true
                ?const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : Text(
                    '$Titel',
                    style:const TextStyle(
                       color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
      ),
    );
  }
}
