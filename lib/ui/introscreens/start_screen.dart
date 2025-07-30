import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:project_evently/l10n/app_localizations.dart';
import 'package:project_evently/ui/providers/language_provider.dart';
import 'package:project_evently/ui/providers/theme_provider.dart';
import 'package:project_evently/ui/utlils/app_assets.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';
import 'package:project_evently/ui/utlils/app_routes.dart';
import 'package:project_evently/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);/// لازم تعرف ال provider جواة ال build لازم
    themeProvider = Provider.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.eventlyIntroScreen),
              SizedBox(height: 24),
              buildImageAssets(themeProvider.mode),
              SizedBox(height: 16),
              buildTitle(),
              buildSubTitle(),
              Padding(
                padding:  EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.languageLabel ,
                    style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Spacer(),
                    buildLanguageToggle(themeProvider.mode),

                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                    AppLocalizations.of(context)!.themeLabel ,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Spacer(),
                    buildThemeToggle(themeProvider.mode),

                  ],
                ),
              ),
              buildLetUsStartButton(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageAssets(ThemeMode  mode) => mode == ThemeMode.light ? Image.asset(AppAssets.onboardingLight) : Image.asset(AppAssets.onboardingDark);

  Widget buildTitle() => Padding(
    padding: EdgeInsets.all(16),
    child: Text(
        AppLocalizations.of(context)!.introTitle4,
      style: Theme.of(context).textTheme.labelMedium,
    ),
  );

  Widget buildSubTitle() => Padding(
    padding: EdgeInsets.all(16),
    child: Text(
        AppLocalizations.of(context)!.introSubtitle4,
      style: Theme.of(context).textTheme.labelSmall,
    ),
  );

  Widget buildLetUsStartButton() => Padding(
    padding:  EdgeInsets.all(16),
    child: CustomButton(text: AppLocalizations.of(context)!.letsStart, onClick: () {
      Navigator.push(context, AppRoutes.introScreens);
    }),
  );

  late LanguageProvider languageProvider;///هنا انا بعملها late عشان اعرفوا انا هاعملها زي الانا كاتبها عند build
  late ThemeProvider themeProvider;

  Widget buildLanguageToggle(ThemeMode mode,) => AnimatedToggleSwitch<String>.dual(///دية معناها انها زي كونتينر كدا جواة ايكون بيتغير مثلا ما بينها وبتتحرك عشان تغير مثلا لغة
    style: ToggleStyle(
      borderColor: AppColors.blue,
      indicatorColor: AppColors.white,
      backgroundColor: mode == ThemeMode.light
          ? AppColors.white
          : AppColors.darkBlue,
    ),
    iconBuilder: (language) =>
        Image.asset(language == "ar" ? AppAssets.icEg : AppAssets.icUsa),/// ودية بتحط فيها صورة بقا اي حاجة عايزها تتحرك وتبقا جواة كونتير وشبهة ليها يعني بس بتتحرك
    current: languageProvider.currentLocale, // ,ودية اللغة الاساسية كدا بقا
    first: "ar",
    second: "en",
    onChanged: (language) {
      languageProvider.changeLanguage(language);/// كدا انا بقولوا اللغة الاساسية تتغير بحسب اللغة الجديدة وكدا شغلنة الصورتين الصغييرين الي تحت ويغير اللغة لما تدوس عليها
    },
  );

  Widget buildThemeToggle(ThemeMode mode,) => AnimatedToggleSwitch<ThemeMode>.dual(///دية معناها انها زي كونتينر كدا جواة ايكون بيتغير مثلا ما بينها وبتتحرك عشان تغير مثلا المود
    style: ToggleStyle(
      borderColor: AppColors.blue,
      indicatorColor: AppColors.white,
      backgroundColor: mode == ThemeMode.light
          ? AppColors.white
          : AppColors.darkBlue,
    ),
    current: themeProvider.mode, // ,ودية اللغة الاساسية كدا بقا
    iconBuilder: (mode) =>
        Icon(mode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),/// ودية بتحط فيها ايكون بقا اي حاجة عايزها تتحرك وتبقا جواة حاجة شبة الكونتير وشبهة ليها يعني بس بتتحرك جواها بس لما تدوس عليها
    first: ThemeMode.light,
    second: ThemeMode.dark,
    onChanged: (mode) {
      themeProvider.changeMode(mode);/// كدا انا بقولوا المود الاساسي تتغير بحسب المود الجديد وكدا شغلنة الايكونيتن الصغييرين الي تحت ويغير المود لما تدوس عليها
    },
  );
}
