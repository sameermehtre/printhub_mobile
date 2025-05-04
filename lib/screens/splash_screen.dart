import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/splash_bloc.dart';
import 'package:flutter_application_1/screens/bottom_navigation_bar.dart';
import 'package:flutter_application_1/screens/onbording_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.read<SplashBloc>().add(CheckNavigationEvent());
    });
  }

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is NavigateToOnboarding) {
          Get.off(() => OnboardingScreen());
        } else if (state is NavigateToHome) {
          Get.off(() => BottomNavigationBarScreen());
        }
      },
      child: Container(
        color: const Color.fromARGB(255, 250, 247, 247),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "PrintHub",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/images/print_hub_logo.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your one-stop solution for all printing needs",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.indigo,
                      fontFamily: 'poppins',
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/img_logo_color_cration.png',
                      width: 150,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Powered by Colour Creation',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 14,
                        fontFamily: 'poppins',
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
