import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(gradient: AppTheme.gradients.background),
          child: SafeArea(
            top: true,
            bottom: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Opacity(
                          opacity: 0.2,
                          child: Image.asset(
                            "assets/images/left-rectangle.png",
                            width: 198,
                            height: 98,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Opacity(
                          opacity: 0.2,
                          child: Image.asset(
                            "assets/images/left-rectangle.png",
                            width: 128,
                            height: 112,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/logo.png",
                  width: 128,
                  height: 112,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Opacity(
                          opacity: 0.2,
                          child: Image.asset(
                            "assets/images/right-rectangle.png",
                            width: 128,
                            height: 112,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Opacity(
                          opacity: 0.2,
                          child: Image.asset(
                            "assets/images/right-rectangle.png",
                            width: 198,
                            height: 98,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
