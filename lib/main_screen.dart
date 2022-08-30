import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutterapp/fixed_dates_slider.dart';
import 'package:flutterapp/constants.dart';
import 'package:flutterapp/offer_row.dart';
import 'dart:ui';
import 'package:flutterapp/ui/second_complete_row.dart';
import 'package:flutterapp/ui/first_dates_row.dart';
import 'package:flutterapp/ui/fourth_network_row.dart';
import 'package:flutterapp/ui/third_todays_row.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  late ScrollController _controller;
  bool isShownBottomWidget = false;

  void _scrollListener() {
    if (_controller.offset >= 115) {
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
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(95.0),
          child: AppBar(
            backgroundColor: Colors.white.withOpacity(0.0),
            centerTitle: false,
            leadingWidth: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                color: Colors.white.withOpacity(0.0),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 15,
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
                ),
              ),
            ),
            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        body: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _controller,
          reverse: false,
          slivers: [
            SliverStickyHeader(
              overlapsContent: true,
              header: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: isShownBottomWidget ? 186.0 : 144.0,
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      width: MediaQuery.of(context).size.width,
                      height: isShownBottomWidget ? 95.0 : 0.0,
                      top: isShownBottomWidget ? 143.0 : 140.0,
                      duration: const Duration(milliseconds: 400),
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
                          return const SizedBox(height: 125);
                        }
                      case 1:
                        {
                          return const FirstDatesRow();
                        }
                      case 2:
                        {
                          return const SecondCompleteRow();
                        }
                      case 3:
                        {
                          return const ThirdTodaysRow();
                        }
                      case 4:
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
