import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const LumoApp());
}

class LumoApp extends StatelessWidget {
  const LumoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      home: const HomePage(),
    );
  }
}
