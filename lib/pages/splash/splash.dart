import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zobo/colors/colors.dart';
import 'package:zobo/core/utils/enums/router.enums.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Image.asset(
              'assets/images/zobo_logo.png',
              width: 200,
              height: 200,
            )
            .animate()
            .fadeIn(duration: 0.5.seconds)
            .then(delay: 2.seconds)
            .scale(duration: 1.seconds)
            .then(delay: 1.5.seconds)
            .fadeOut(duration: 1.seconds)
            .then(delay: 0.5.seconds)
            .callback(
              callback:
                  (_) => context.router.replacePath(RouteEnums.homePath.value),
            ),
      ),
    );
  }
}
