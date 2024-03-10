import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/splash/presentation/views/widgets/animated_text.dart';
import 'package:sakeny/core/utils/App_router.dart';
import 'package:sakeny/core/utils/internet_connection.dart';
import 'package:sakeny/core/utils/size_config.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

late AnimationController animationController;
late Animation<Offset> slidingAnimation;
Map _source = {ConnectivityResult.none: false};
final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    initSlidingText();
    checkForNetworkAndDisplayResult();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                'assets/pngs/logo-color.png',
                scale: SizeConfig.defaultSize! * 1.2,
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: AnimatedText())
        ],
      ),
    );
  }

  initSlidingText() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 6), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  checkForNetworkAndDisplayResult() {
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;

      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
          if (_source.values.toList()[0]) {
            // If online, navigate to the next page
            Future.delayed(const Duration(seconds: 2), () {
              var auth = FirebaseAuth.instance.currentUser;
              if (auth == null) {
                GoRouter.of(context).pushReplacement(AppRouter.kSignUpView);
              } else {
                GoRouter.of(context).pushReplacement(AppRouter.kMainView);
              }
            });
          } else {
            showOfflineDialog();
          }
          break;
        case ConnectivityResult.none:
          showOfflineDialog();
          break;

        default:
      }
    });
  }

  void showOfflineDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(' You are Offline'),
          content: const Text('Please connect to the internet then try again.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                SystemNavigator.pop(); // Close the app
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
