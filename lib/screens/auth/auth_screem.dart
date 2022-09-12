import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/auth/components/custom_mobile.dart';
import 'package:admin/screens/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'components/custom_desktop_tablet.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: (Responsive.isDesktop(context) ||
                        Responsive.isTablet(context))
                    ? CustomDesktopTabletScreem(authController: _authController,)
                    : CustomMobileScreem())
          ],
        ),
      ),
    );
  }
}
