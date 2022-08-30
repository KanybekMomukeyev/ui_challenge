import 'package:flutter/material.dart';
import 'package:flutterapp/constants.dart';
import 'package:flutterapp/ui/circle_dot.dart';

class FirstDatesRow extends StatelessWidget {
  const FirstDatesRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green[50],
      color: Colors.white,
      padding: const EdgeInsets.only(top: 1.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            _ExpandbleDateItem(
              todayTitle: "TODAY",
              isTodayTitleVisible: true,
              weekDay: "Mon",
              monthName: "Oct",
              monthDay: "18",
              isDotWidgetShown: true,
              dotColor: AppColors.redBright,
            ),
            _ExpandbleDateItem(
              weekDay: "Tue",
              monthName: "Oct",
              monthDay: "19",
              isDotWidgetShown: true,
              dotColor: AppColors.blueFaded,
            ),
            _ExpandbleDateItem(
              weekDay: "Wed",
              monthName: "Oct",
              monthDay: "20",
            ),
            _ExpandbleDateItem(
              weekDay: "Thu",
              monthName: "Oct",
              monthDay: "21",
              isDotWidgetShown: true,
            ),
            _ExpandbleDateItem(
              todayTitle: "TODAY",
              weekDay: "Fri",
              monthName: "Oct",
              monthDay: "22",
            ),
            _ExpandbleDateItem(
              weekDay: "Sat",
              monthName: "Oct",
              monthDay: "23",
            ),
            _ExpandbleDateItem(
              weekDay: "Sun",
              monthName: "Oct",
              monthDay: "24",
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpandbleDateItem extends StatelessWidget {
  final String todayTitle;
  final bool isTodayTitleVisible;
  final String weekDay;
  final String monthName;
  final String monthDay;
  final bool isDotWidgetShown;
  final Color? dotColor;

  const _ExpandbleDateItem({
    Key? key,
    this.todayTitle = "TODAY",
    this.isTodayTitleVisible = false,
    required this.weekDay,
    required this.monthName,
    required this.monthDay,
    this.isDotWidgetShown = false,
    this.dotColor = AppColors.redBright,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 25, left: (isTodayTitleVisible ? 16 : 2), right: 2, bottom: 5),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.dateBackgroundBlackColor,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          maxWidth: 62,
          minWidth: 62,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Visibility(
                visible: isTodayTitleVisible,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    todayTitle,
                    style: AppTextStyles.semiboldStyle(context)
                        ?.copyWith(fontSize: 10, color: AppColors.grey100Color),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: isTodayTitleVisible ? 4.0 : 12),
                child: Text(
                  weekDay,
                  style: AppTextStyles.semiboldStyle(context)
                      ?.copyWith(fontSize: 12, color: AppColors.textWhiteColor),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  monthName,
                  style: AppTextStyles.mediumStyle(context)
                      ?.copyWith(fontSize: 10, color: AppColors.textWhiteColor),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 4.0, bottom: isDotWidgetShown ? 0 : 12),
                child: Text(
                  monthDay,
                  style: AppTextStyles.boldStyle(context)
                      ?.copyWith(fontSize: 16, color: AppColors.textWhiteColor),
                ),
              ),
            ),
            Flexible(
              child: Visibility(
                visible: isDotWidgetShown,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                  child: CircleDot(circleColor: dotColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
