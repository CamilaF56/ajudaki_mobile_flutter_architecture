import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dependencies.dart';
import 'ui/work_listing/widgets/work_listing_screen.dart';

void main() {
  runApp(MultiProvider(providers: providersRemote, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WorkListingScreen(),
    );
  }
}