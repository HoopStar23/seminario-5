import 'package:flutter/material.dart';
import 'package:prefeusuarios/screens/home_screen.dart';

Map<String,WidgetBuilder> getApplicationsRoutes(){
  return<String, WidgetBuilder>{
    '/':(BuildContext context) => HomeScreen(),
    'home':(BuildContext context) => HomeScreen(),
  };
}