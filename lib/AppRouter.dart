import 'package:flutter/material.dart';
import 'package:lean/Pages/Pages.dart';
import 'dart:async';
import 'package:lean/Models/Models.dart';

enum TransitionType { FadeIn, InFromRight, InFromLeft }

class AppRouter {
  AppRouter();

  PageRoute<T> getPageRoute<T>(Widget page, TransitionType transitionType,
      {Duration transitionDuration: const Duration(milliseconds: 200)}) {
    return PageRouteBuilder<T>(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return page;
        },
        transitionsBuilder: getTransitionRoute(transitionType),
        transitionDuration: transitionDuration);
  }

  RouteTransitionsBuilder getTransitionRoute(TransitionType transitionType) {
    return (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      if (transitionType == TransitionType.FadeIn) {
        return new FadeTransition(opacity: animation, child: child);
      } else {
        const Offset topLeft = const Offset(0.0, 0.0);
        const Offset topRight = const Offset(1.0, 0.0);
        const Offset bottomLeft = const Offset(0.0, 1.0);
        Offset startOffset = bottomLeft;
        Offset endOffset = topLeft;
        if (transitionType == TransitionType.InFromLeft) {
          startOffset = const Offset(-1.0, 0.0);
          endOffset = topLeft;
        } else if (transitionType == TransitionType.InFromRight) {
          startOffset = topRight;
          endOffset = topLeft;
        }
        return new SlideTransition(
          position: new Tween<Offset>(
            begin: startOffset,
            end: endOffset,
          ).animate(animation),
          child: child,
        );
      }
    };
  }

  void goHome(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(getPageRoute(HomePage(), TransitionType.FadeIn));
  }

  void goObjectDetection(BuildContext context) {
    Navigator.of(context)
        .push(getPageRoute(ObjectDetectionPage(), TransitionType.InFromRight));
  }

  void goCoupon(BuildContext context, Reward reward) {
    Navigator.of(context)
        .push(getPageRoute(CouponPage(reward), TransitionType.InFromRight));
  }

  
}
