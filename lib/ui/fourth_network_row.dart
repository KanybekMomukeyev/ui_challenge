import 'package:flutter/material.dart';
import 'package:flutterapp/constants.dart';
import 'package:flutterapp/ui/icomoon_icons.dart';

class FourthNetworkRow extends StatelessWidget {
  const FourthNetworkRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green[300],
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            _NetworkItem(
              title: "My network",
              subTitle: "Connect and grow your network",
              startColor: AppColors.firstStartBackgroundColor,
              endColor: AppColors.firstEndBackgroundColor,
              networkIcon: Icon(
                IcoMoonIcons.my_network,
                size: 40,
                color: AppColors.textWhiteColor,
              ),
            ),
            _NetworkItem(
              title: "Quick hire",
              subTitle: "Hire someone quickly today",
              startColor: AppColors.secondStartBackgroundColor,
              endColor: AppColors.secondEndBackgroundColor,
              networkIcon: Icon(
                IcoMoonIcons.quick_hire,
                size: 40,
                color: AppColors.textWhiteColor,
              ),
            ),
            _NetworkItem(
              title: "My CV",
              subTitle: "Kepp your CV updated to get the best offers",
              startColor: AppColors.thirdStartBackgroundColor,
              endColor: AppColors.thirdEndBackgroundColor,
              networkIcon: Icon(
                IcoMoonIcons.my_cv,
                size: 40,
                color: AppColors.textWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NetworkItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color startColor;
  final Color endColor;
  final Icon networkIcon;
  const _NetworkItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.startColor,
    required this.endColor,
    required this.networkIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          gradient: LinearGradient(
            colors: [
              startColor,
              endColor,
            ],
            stops: const [
              0.1,
              0.9,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 17.0, left: 12, right: 48),
                child: networkIcon,
              ),
            ),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 12, right: 12),
              child: Text(title,
                  style:
                      AppTextStyles.boldStyle(context)?.copyWith(fontSize: 14)),
            )),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 12, right: 12),
              child: Text(subTitle,
                  style: AppTextStyles.mediumStyle(context)
                      ?.copyWith(fontSize: 10)),
            )),
          ],
        ),
      ),
    );
  }
}
