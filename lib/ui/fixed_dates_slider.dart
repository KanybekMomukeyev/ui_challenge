import 'package:flutter/material.dart';
import 'package:flutterapp/constants/constants.dart';
import 'package:flutterapp/ui/circle_dot.dart';

class FixedDatesRow extends StatelessWidget {
  const FixedDatesRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueGrey,
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            _ExpandbleItem(
              todayTitle: 'TODAY',
              title: 'Mon',
              subTitle: '18 Oct.',
              isDotWidgetShown: true,
              dotColor: AppColors.redBright,
            ),
            _ExpandbleItem(
              title: 'Tue',
              subTitle: '19 Oct.',
            ),
            _ExpandbleItem(
              title: 'Wed',
              subTitle: '20 Oct.',
              isDotWidgetShown: true,
              dotColor: AppColors.blueFaded,
            ),
            _ExpandbleItem(
              title: 'Thu',
              subTitle: '21 Oct.',
              isDotWidgetShown: true,
              dotColor: AppColors.redBright,
            ),
            _ExpandbleItem(
              title: 'Fri',
              subTitle: '22 Oct.',
            ),
            _ExpandbleItem(
              title: 'Sat',
              subTitle: '23 Oct.',
            ),
            _ExpandbleItem(
              title: 'Sun',
              subTitle: '24 Oct.',
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpandbleItem extends StatelessWidget {
  final String? todayTitle;
  final String title;
  final String subTitle;
  final bool isDotWidgetShown;
  final Color? dotColor;

  const _ExpandbleItem({
    Key? key,
    this.todayTitle,
    required this.title,
    required this.subTitle,
    this.isDotWidgetShown = false,
    this.dotColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 2, left: 2, bottom: 4),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.dateBackgroundBlackColor,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        constraints: const BoxConstraints(
          maxHeight: 36,
          minHeight: 36,
          maxWidth: double.infinity,
        ),
        padding: const EdgeInsets.only(top: 7.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (todayTitle != null)
                        ? Padding(
                            padding: const EdgeInsets.only(left: 0.0, top: 0.0),
                            child: Text(
                              todayTitle!,
                              style: AppTextStyles.semiboldStyle(context)
                                  ?.copyWith(
                                      fontSize: 10,
                                      color: AppColors.grey100Color),
                            ),
                          )
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: Text(
                        title,
                        style: AppTextStyles.mediumStyle(context)
                            ?.copyWith(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: isDotWidgetShown,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: CircleDot(circleColor: dotColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: isDotWidgetShown ? 5.0 : 15.0,
                          right: isDotWidgetShown ? 8.0 : 15.0),
                      child: Text(
                        subTitle,
                        style: AppTextStyles.mediumStyle(context)
                            ?.copyWith(fontSize: 10),
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
