import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:project_evently/l10n/app_localizations.dart';
import 'package:project_evently/ui/providers/language_provider.dart';
import 'package:project_evently/ui/providers/theme_provider.dart';
import 'package:project_evently/ui/utlils/app_assets.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';
import 'package:project_evently/widgets/custom_button.dart';
import 'package:project_evently/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

///Provider.of(context , listen: true or false ) : انا هنا دية معناها انا الفايل دا بيسمع حاجة والمفروض تظهر لو قولتلوا صح فا هوا اصلا دا عادي بتاعو طب لو غلط الحاجة الي عايزها تشتغل مش هتشتغل اكنك معملتش حااجة
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
   languageProvider = Provider.of(context);  /// لازم تعرف ال provider جواة ال build لازم
   themeProvider = Provider.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildAppLogo(context),
                SizedBox(height: 24),
                buildEmailTextField(),
                SizedBox(height: 16),
                buildPasswordTextField(),
                SizedBox(height: 16),
                buildForgetPassword(),
                SizedBox(height: 24),
                buildLoginButton(),
                SizedBox(height: 24),
                buildSignUpText(),
                SizedBox(height: 24),
                buildOrRow(),
                SizedBox(height: 24),
                buildGoogleLogin(themeProvider.mode), /// علي حسب المود
                SizedBox(height: 24),
                buildLanguageToggle(),
                SizedBox(height: 24),
                buildThemeToggle()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAppLogo(context) => Image.asset(
    AppAssets.appVerticalLogo,
    height: MediaQuery.of(context).size.height * 0.2,
  );

  Widget buildEmailTextField() => CustomTextField(
    mode: themeProvider.mode,  /// هنا بقولوا علي حسب المود الي اختاروا
      hint: AppLocalizations.of(context)!.emailHint, ///دية كدا معانها اني بقولوا الايميل مكتوبة بالعربي والانجليزي يعني ونفس الكلام في الباقي
      prefixIcon: AppSvg.icEmail
  );

  Widget buildPasswordTextField() => CustomTextField(
    mode:  themeProvider.mode,
    hint: AppLocalizations.of(context)!.passwordHint,
    prefixIcon: AppSvg.icPassword,
    isPassword: true,
  );

  Widget buildForgetPassword() => Container(
    color: Colors.transparent,
    width: double.infinity,
    child: Text(///حاجة انا عملت هنا اني بحط الcontext كنت كاتبو في البارميتر بتاعها  انا بعرفوا عشان انا فيstatelessWidget مش في ال statefulWidget لو انا فيها مكنتش هعرفها الكونتكست زي ما انا عامل
      AppLocalizations.of(context)!.forgetPassword,
          textAlign: TextAlign.end,
          style: Theme
              .of(context)
              .textTheme
              .labelMedium!
              .copyWith(
              fontStyle: FontStyle.italic, ///هنا بقولوا هاتلي نفس الحاجة بس خلية الستايل بس يبقا italic الي هوا مش متوازي شوية
            decoration: TextDecoration.underline ,
            decorationColor: AppColors.blue ,
          ),
        ),
  );

  Widget buildLoginButton() => CustomButton(text: AppLocalizations.of(context)!.loginButton, onClick: (){},);

  Widget buildSignUpText() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(AppLocalizations.of(context)!.noAccountText , ///دية معناها اني انا عامل التحويل من الانجليزي للعربي وعاملهم في فايل هوا هيحول الكلمة بقا لو لما يجي يغير من انجليزي لعربي نفس الكلام في كلو
        style: Theme
          .of(context)
          .textTheme
          .labelSmall!
          .copyWith(
          fontStyle: FontStyle.italic,
          ),
      ),
      Text(AppLocalizations.of(context)!.createAccount, style: Theme
          .of(context)
          .textTheme
          .labelMedium!
          .copyWith(
        fontStyle: FontStyle.italic, decoration: TextDecoration.underline,
        decorationColor: AppColors.blue,
      ),
        ),


    ],
  );

  Widget buildOrRow() => Row(
    children: [
      Expanded(child: Divider(

        endIndent: 20, indent: 20,)) ,
      SizedBox(width: 2,),
      Text(AppLocalizations.of(context)!.orText , style: Theme.of(context).textTheme.labelMedium),
      SizedBox(width: 2,),
      Expanded(child: Divider(

        endIndent: 20, indent: 20,)),

    ],
  );

  Widget buildGoogleLogin(ThemeMode mode) =>
      CustomButton(text: AppLocalizations.of(context)!.googleLogin,
         icon:Image.asset(AppAssets.icGoogle) ,
        onClick: () {},
        backgroundColor: mode == ThemeMode.light ? AppColors.white : Colors.transparent,///هنا بقولوا يتغير علي حسب المود
        textColor: AppColors.blue,);


  late LanguageProvider languageProvider ; ///هنا انا بعملها late عشان اعرفوا انا هاعملها زي الانا كاتبها عند build
  late ThemeProvider themeProvider ;
  Widget buildLanguageToggle() => AnimatedToggleSwitch<String>.dual( ///دية معناها انها زي كونتينر كدا جواة ايكون بيتغير مثلا ما بينها وبتتحرك عشان تغير مثلا لغة
     iconBuilder: (language)=> Image.asset(language == "ar" ? AppAssets.icEg : AppAssets.icUsa ), /// ودية بتحط فيها صورة بقا اي حاجة عايزها تتحرك وتبقا جواة كونتير وشبهة ليها يعني بس بتتحرك
      current: languageProvider.currentLocale,  // ,ودية اللغة الاساسية كدا بقا
      first: "ar", 
      second: "en" ,
     onChanged: (language){
       languageProvider.changeLanguage(language) ;/// كدا انا بقولوا اللغة الاساسية تتغير بحسب اللغة الجديدة وكدا شغلنة الصورتين الصغييرين الي تحت ويغير اللغة لما تدوس عليها

     },
  );

  Widget buildThemeToggle() => AnimatedToggleSwitch<ThemeMode>.dual( ///دية معناها انها زي كونتينر كدا جواة ايكون بيتغير مثلا ما بينها وبتتحرك عشان تغير مثلا المود
    current:  themeProvider.mode ,  // ,ودية اللغة الاساسية كدا بقا
    iconBuilder: (mode)=>
        Icon(mode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),  /// ودية بتحط فيها ايكون بقا اي حاجة عايزها تتحرك وتبقا جواة حاجة شبة الكونتير وشبهة ليها يعني بس بتتحرك جواها بس لما تدوس عليها
    first: ThemeMode.light,
    second: ThemeMode.dark ,
    onChanged: (mode){
      themeProvider.changeMode(mode) ;/// كدا انا بقولوا المود الاساسي تتغير بحسب المود الجديد وكدا شغلنة الايكونيتن الصغييرين الي تحت ويغير المود لما تدوس عليها

    },
  );
}
