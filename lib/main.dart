import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_evently/firebase_options.dart';
import 'package:project_evently/l10n/app_localizations.dart';
import 'package:project_evently/ui/providers/language_provider.dart';
import 'package:project_evently/ui/providers/theme_provider.dart';
import 'package:project_evently/ui/screens/login/login.dart';
import 'package:project_evently/ui/utlils/app_theme.dart';
import 'package:provider/provider.dart';

 void main() async {
   WidgetsFlutterBinding.ensureInitialized();   /// الجزء دا عشان نعرف ال firebase بس ومتنساش package firebase_core
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      theme: AppTheme.lightTheme , /// هنا معاناها كل حاجة بقا عاملها الوان وكدا هتظهر لواحدها بدل ما تعمل لكل حاجة لون وممكن بردو تستخدم theme.of(context)وتكمل بقا لو عايز تجيب حاجاة بردو
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
      home: Login(),

    );
  }
}
