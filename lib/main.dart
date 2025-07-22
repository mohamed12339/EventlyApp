import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_evently/l10n/app_localizations.dart';
import 'package:project_evently/ui/providers/language_provider.dart';
import 'package:project_evently/ui/providers/theme_provider.dart';
import 'package:project_evently/ui/screens/splash/splash.dart';
import 'package:project_evently/ui/utlils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(ChangeNotifierProvider( /// multi provider لا ممكن اعمل r بدل ما اعمل كل شوية واحدة change notifier
  //   create: (_) => ThemeProvider(),
  //   child: ChangeNotifierProvider(
  //     ///انا كتبت دية عشان اقدر استخم ال provider والابلكيشن اقدر اربطوا كلو مش الي كنت بعملها في  فايل يعني بدل setstateالي بتتعمل في فايل واحد وللحاجة معينة والاهم اني عملت extends changeNotifier عشان اقدر استخدم فايل ال language provider مكتوبة هناك
  //       create: (_) => LanguageProvider(),
  //       child: MyApp()),
  // )
  // );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>LanguageProvider()),
        ChangeNotifierProvider(create: (_)=>ThemeProvider()),
      ],
      child: MyApp())
  );
}


class MyApp extends StatelessWidget {
  MyApp({super.key});
 late LanguageProvider languageProvider ;///هنا انا بعملها late عشان اعرفوا انا هاعملها زي الانا كاتبها عند build
 late ThemeProvider themeProvider ;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);  /// لازم تعرف ال provider جواة ال build لازم ونفس الكلام في التانية
    themeProvider = Provider.of(context);
    return MaterialApp(
      theme: AppTheme.lightTheme ,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.mode, ///كدا انا بقولوا اشتغل علي حسب المستخدم لما يجي يحول الابيلكيشن لlight or dark
      locale: Locale(languageProvider.currentLocale),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      home: const Splash(),

    );
  }
}
