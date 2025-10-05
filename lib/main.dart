import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'core/data/api_client.dart';
import 'core/navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  ApiClient.initialize();

  runApp(const LumoApp());
}

class LumoApp extends StatelessWidget {
  const LumoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      themeMode: ThemeMode.dark,
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: ShadColorScheme.fromName('red'),
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: ShadColorScheme.fromName(
          'red',
          brightness: Brightness.dark,
        ),
      ),
      appBuilder: (context) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: CupertinoApp.router(
            debugShowCheckedModeBanner: false,
            theme: CupertinoTheme.of(context),
            routerConfig: appRouter,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en', 'US'), Locale('km', 'KH')],
            builder: (context, child) {
              return ShadAppBuilder(child: child!);
            },
          ),
        );
      },
    );
  }
}
