import 'package:flutter/material.dart';
import 'package:flutterapp/constants.dart';
import 'package:flutterapp/ui/icomoon_icons.dart';

class ThirdTodaysRow extends StatelessWidget {
  const ThirdTodaysRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green[200],
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16),
              child: Text(
                'Today’s productions',
                style: AppTextStyles.semiboldStyle(context)?.copyWith(
                  color: AppColors.black50,
                  fontSize: 18,
                ),
              ),
            ),
            const _TodayItem(
              index: 0,
              title: "Production Name That is Long",
              subTitile: "Sweden  Jan 14, 2022 - Feb 23, 2023 ",
            ),
            const _TodayItem(
              index: 1,
              title:
                  "What has bee seen very very long text very long textvery long textvery long text very long text very long text very long text",
              subTitile: "Sweden  Jan 14, 2022 - Feb 23, 2023 ",
            ),
          ],
        ),
      ),
    );
  }
}

class _TodayItem extends StatelessWidget {
  final int index;
  final String title;
  final String subTitile;

  const _TodayItem({
    Key? key,
    required this.index,
    required this.title,
    required this.subTitile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: (index == 0) ? 14.0 : 10,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.completeBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        height: 70,
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
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (index == 0)
                    ? const _LeftImage(
                        assetPath: 'assets/images/production_name.png')
                    : const _LeftImage(
                        assetPath: 'assets/images/what_has_been.png'),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 0, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _EllipsisText(
                          title: title,
                          textStyle: AppTextStyles.semiboldStyle(context)
                              ?.copyWith(
                                  fontSize: 14,
                                  color: AppColors.dateBackgroundBlackColor)),
                      _EllipsisText(
                          title: subTitile,
                          textStyle: AppTextStyles.regularStyle(context)
                              ?.copyWith(
                                  fontSize: 10, color: AppColors.black10)),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5, top: 0),
                  child: Icon(
                    IcoMoonIcons.arrow_right_1,
                    size: 10,
                    color: AppColors.grey100Color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EllipsisText extends StatelessWidget {
  const _EllipsisText({
    Key? key,
    required this.title,
    required this.textStyle,
  }) : super(key: key);

  final String title;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: textStyle,
      ),
    );
  }
}

class _LeftImage extends StatelessWidget {
  final String assetPath;
  const _LeftImage({
    Key? key,
    required this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(assetPath)),
        color: Colors.blue,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4.0),
          bottomLeft: Radius.circular(4.0),
        ),
      ),
    );
  }
}
