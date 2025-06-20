import 'package:auvnet_internship_assessment/features/auth/presentation/screens/login_screen.dart';
import 'package:auvnet_internship_assessment/features/home_page/presentation/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import '../../features/auth/presentation/bloc/signup_bloc/signup_bloc.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../di/di.dart';
import 'app_router.dart';


class RouteGenerator{
  static Route <dynamic> getRoute(RouteSettings settings){
    switch (settings.name) {

      case Routes.signInRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<LoginBloc>(),
            child: LoginScreen(),
          ),
        );

      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(
        builder: (_) => BlocProvider(
    create: (_) => getIt<SignupBloc>(),
    child: SignupScreen(),

          ),);

      case Routes.homeScreen:
        return MaterialPageRoute(
    builder: (_) =>  HomeScreen()

        );


      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) =>  OnboardingPage());
      default:
        return unDefinedRoute();


    }

  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(
        builder: (_)=>Scaffold(
          appBar: AppBar(
            title: const Text('No Route Found'),
          ),
          body: const Center(child: Text('No Route Found'),),
        )
    );
  }
}