import 'package:flutter/material.dart';
import 'package:flutterapp/constants/constants.dart';
import 'package:flutterapp/constants/icomoon_icons.dart';

class CommonArrowButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonTitle;

  const CommonArrowButton({
    Key? key,
    required this.onTap,
    required this.buttonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 35,
        maxWidth: double.infinity,
      ),
      child: Material(
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    buttonTitle,
                    style: AppTextStyles.mediumStyle(context)?.copyWith(
                      color: AppColors.dateBackgroundBlackColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 5, top: 1.5),
                  child: Icon(
                    IcoMoonIcons.arrow_right_1,
                    size: 10,
                    color: AppColors.dateBackgroundBlackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
