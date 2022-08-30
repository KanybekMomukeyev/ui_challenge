import 'package:flutter/material.dart';
import 'package:flutterapp/constants.dart';
import 'package:flutterapp/ui/comon_arrow_button.dart';

class SecondCompleteRow extends StatelessWidget {
  const SecondCompleteRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green[100],
      color: Colors.white,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            _SecondCompleteItem(
              title:
                  "Complete your profile tooptimize your exposure in job searches.",
              index: 0,
              buttonTitle: "Complete profile",
              isProgressShown: true,
            ),
            _SecondCompleteItem(
              title:
                  "Connect with people you might know and extend your network.",
              index: 1,
              buttonTitle: "Connect",
            ),
            _SecondCompleteItem(
              title: "Get verified as an industry professional.",
              index: 2,
              buttonTitle: "Get verified",
            ),
          ],
        ),
      ),
    );
  }
}

class _SecondCompleteItem extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final int index;
  final bool isProgressShown;
  const _SecondCompleteItem({
    Key? key,
    required this.title,
    required this.buttonTitle,
    required this.index,
    this.isProgressShown = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 16, left: (index == 0 ? 16 : 0), right: (index == 2 ? 16 : 10)),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.completeBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        height: 136,
        width: 300,
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          children: [
            Flexible(
              child: Text(
                title,
                style: AppTextStyles.boldStyle(context)?.copyWith(
                  color: AppColors.dateBackgroundBlackColor,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 0),
              child: isProgressShown
                  ? const _ProgressIndicator()
                  : const SizedBox(width: 10, height: 9.0),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: CommonArrowButton(
                          onTap: () {},
                          buttonTitle: buttonTitle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 190,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.blueFaded, AppColors.blueFaded],
              stops: [
                0.1,
                0.9,
              ],
            ),
          ),
          child: const SizedBox(
            height: 9.0,
          ),
        ),
        Container(
          width: 78,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.textWhiteColor, AppColors.textWhiteColor],
              stops: [
                0.1,
                0.9,
              ],
            ),
          ),
          child: const SizedBox(
            height: 9.0,
          ),
        ),
      ],
    );
  }
}
