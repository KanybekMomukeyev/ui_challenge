import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutterapp/ui/fixed_dates_slider.dart';
import 'package:flutterapp/constants/constants.dart';
import 'package:flutterapp/ui/offer_row.dart';
import 'dart:ui';
import 'package:flutterapp/ui/second_complete_row.dart';
import 'package:flutterapp/ui/first_dates_row.dart';
import 'package:flutterapp/ui/fourth_network_row.dart';
import 'package:flutterapp/ui/third_todays_row.dart';
import 'package:flutterapp/ui/circle_dot.dart';

class MainBlurScreen_UNUSED extends StatefulWidget {
  const MainBlurScreen_UNUSED({
    Key? key,
  }) : super(key: key);

  @override
  State<MainBlurScreen_UNUSED> createState() => _MainBlurScreen_UNUSEDState();
}

class _MainBlurScreen_UNUSEDState extends State<MainBlurScreen_UNUSED> {
  late ScrollController _controller;
  bool isShownBottomWidget = false;

  void _scrollListener() {
    if (_controller.offset >= 100) {
      _showWidget();
    } else {
      _hideWidget();
    }
  }

  void _hideWidget() {
    if (isShownBottomWidget != false) {
      setState(() {
        isShownBottomWidget = false;
      });
    }
  }

  void _showWidget() {
    if (isShownBottomWidget != true) {
      setState(() {
        isShownBottomWidget = true;
      });
    }
  }

  @override
  void initState() {
    _controller = ScrollController(initialScrollOffset: 0);
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultStickyHeaderController(
      child: Scaffold(
        body: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _controller,
          reverse: false,
          slivers: [
            SliverAppBar(
              elevation: 0,
              centerTitle: false,
              expandedHeight: 95.0,
              collapsedHeight: 95.0,
              toolbarHeight: 95.0,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0.0,
                        height: 1,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 110,
                        left: 16.0,
                        right: 0.0,
                        height: 64,
                        child: SizedBox(
                          width: 30,
                          height: 20,
                          child: Text(
                            textAlign: TextAlign.left,
                            "My Availability",
                            style: AppTextStyles.semiboldStyle(context),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              pinned: true,
              floating: false,
              snap: false,
              actions: const [],
            ),
            SliverStickyHeader(
              overlapsContent: true,
              header: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: isShownBottomWidget ? 70.0 : 50.0,
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      width: MediaQuery.of(context).size.width,
                      height: isShownBottomWidget ? 100.0 : 10.0,
                      top: isShownBottomWidget ? 0.0 : -100.0,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.linearToEaseOut,
                      child: const FixedDatesRow(),
                    ),
                  ],
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, int index) {
                    switch (index) {
                      case 0:
                        {
                          return const FirstDatesRow();
                        }
                      case 1:
                        {
                          return const SecondCompleteRow();
                        }
                      case 2:
                        {
                          return const ThirdTodaysRow();
                        }
                      case 3:
                        {
                          return const FourthNetworkRow();
                        }
                      default:
                        break;
                    }
                    return SizedBox(
                      height: 100,
                      child: OfferRow(index: index),
                    );
                  },
                  childCount: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
