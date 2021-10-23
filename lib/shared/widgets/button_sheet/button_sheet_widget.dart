import 'package:app_pay_flow/shared/themes/app_colors.dart';
import 'package:app_pay_flow/shared/themes/app_text_styles.dart';
import 'package:app_pay_flow/shared/widgets/set_label_button/set_label_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final String title;
  final String subtitle;

  const ButtonSheetWidget(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secondaryLabel,
      required this.secondaryOnPressed,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.black.withOpacity(0.6),
                )),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text.rich(TextSpan(
                          style: TextStyles.buttonBoldHeading,
                          text: title,
                          children: [TextSpan(style: TextStyles.buttonHeading,text: "\n$subtitle")]),
                          textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.stroke,),
                    SetLabelButton(
                      enablePrimaryColor: true,
                      primaryLabel: primaryLabel,
                      primaryOnPressed: primaryOnPressed,
                      secondaryLabel: secondaryLabel,
                      secondaryOnPressed: secondaryOnPressed,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
