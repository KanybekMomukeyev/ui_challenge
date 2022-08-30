import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterapp/constants.dart';
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
            _FirstFixedDateItem(),
            _FixedDateItem(
              title: 'Tue',
              subTitle: '19 Oct.',
              isDotWidgetShown: false,
              dotColor: AppColors.blueFaded,
            ),
            _FixedDateItem(
              title: 'Wed',
              subTitle: '20 Oct.',
              isDotWidgetShown: true,
              dotColor: AppColors.blueFaded,
            ),
            _FixedDateItem(
              title: 'Thu',
              subTitle: '21 Oct.',
              isDotWidgetShown: true,
              dotColor: AppColors.redBright,
            ),
            _FixedDateItem(
              title: 'Fri',
              subTitle: '22 Oct.',
              isDotWidgetShown: false,
              dotColor: AppColors.blueFaded,
            ),
            _FixedDateItem(
              title: 'Sat',
              subTitle: '23 Oct.',
              isDotWidgetShown: false,
              dotColor: AppColors.blueFaded,
            ),
            _FixedDateItem(
              title: 'Sun',
              subTitle: '24 Oct.',
              isDotWidgetShown: false,
              dotColor: AppColors.blueFaded,
            ),
          ],
        ),
      ),
    );
  }
}

class _FirstFixedDateItem extends StatelessWidget {
  const _FirstFixedDateItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 2, left: 4, bottom: 4),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.dateBackgroundBlackColor,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        height: 36,
        width: 76,
        padding: const EdgeInsets.only(top: 7.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: [
                    TextSpan(
                      style: AppTextStyles.semiboldStyle(context)?.copyWith(
                          fontSize: 10, color: AppColors.grey100Color),
                      text: "TODAY",
                    ),
                    TextSpan(
                      style: AppTextStyles.mediumStyle(context)
                          ?.copyWith(fontSize: 10),
                      text: "  Mon",
                    ),
                  ]),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 0),
                    child: CircleDot(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "18 Oct.",
                      style: AppTextStyles.mediumStyle(context)
                          ?.copyWith(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FixedDateItem extends StatelessWidget {
  final String title;
  final String subTitle;

  final bool isDotWidgetShown;
  final Color? dotColor;

  const _FixedDateItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.isDotWidgetShown,
    required this.dotColor,
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
        height: 36,
        width: 60,
        padding: const EdgeInsets.only(top: 7.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Text(
                  title,
                  style: AppTextStyles.mediumStyle(context)
                      ?.copyWith(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: isDotWidgetShown,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: CircleDot(circleColor: dotColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      subTitle,
                      style: AppTextStyles.mediumStyle(context)
                          ?.copyWith(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------  //
// UNUSED
class BasicCarouselSlider extends StatelessWidget {
  const BasicCarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          color: Colors.white.withOpacity(1.0),
          height: 50,
          width: constraints.maxWidth,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              aspectRatio: 4.0,
              enlargeCenterPage: false,
              viewportFraction: 0.15,
              disableCenter: false,
              initialPage: 3,
            ),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                height: 10,
                width: 60,
                color: Colors.amber,
                margin:
                    const EdgeInsets.only(top: 3, bottom: 3, left: 3, right: 3),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text("$realIndex"),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
