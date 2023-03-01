
import 'package:amazon_clone/presentation/auth/views/auth_view.dart';
import 'package:amazon_clone/presentation/resources/color_manager.dart';
import 'package:amazon_clone/presentation/resources/strings.dart';
import 'package:amazon_clone/presentation/resources/styles/text_style.dart';
import 'package:flutter/material.dart';

class Routes{
  static const String authRoute = "/auth";
}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.authRoute:
        return MaterialPageRoute(builder: (_)=> const AuthView());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: Center(child: Text(AppStrings.noRouteFound,style: getBoldStyle(color: ColorManager.unselectedNavBarColor))),
      ),
    ));
  }
}