import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShadButton(
              child: const Text('View Movies'),
              onPressed: () => context.go('/movies'),
            ),
            const SizedBox(height: 16),
            ShadButton(
              child: const Text('Login'),
              onPressed: () => context.go('/login'),
            ),
          ],
        ),
      ),
    );
  }
}
