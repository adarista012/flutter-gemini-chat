import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:flutter_vertex/app/ui/splash/splash_provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: splashProvider,
      onChange: (_, controller) {
        final routeName = controller.routeName;
        if (routeName != null) {
          router.pushReplacementNamed(
            routeName,
            transition: Transition.zoom,
          );
        }
      },
      builder: (_, __) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              Center(
                child: Image.asset(
                  'images/Google_Gemini_logo.png',
                  width: MediaQuery.sizeOf(context).width / 2,
                ),
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Developed by MobileFire '),
                  Image.asset(
                    'images/mobilefire_logo.png',
                    width: 24.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
