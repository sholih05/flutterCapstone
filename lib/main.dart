import 'providers/dashboard_provider.dart';
import 'package:projek/views/dashboard/chatbot.dart';
import 'package:projek/views/login_views.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (bc) => DashboardProvider()),
        ChangeNotifierProvider(create: (bc) => BeritaPanelProvider()),
      ],
      builder: (context, widget) {
        return const MaterialApp(
          home: LoginViews(),
          debugShowCheckedModeBanner: false,
        );
      }));
}
