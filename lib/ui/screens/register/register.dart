import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_evently/l10n/app_localizations.dart';
import 'package:project_evently/ui/providers/language_provider.dart';
import 'package:project_evently/ui/providers/theme_provider.dart';
import 'package:project_evently/ui/utlils/app_assets.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';
import 'package:project_evently/ui/utlils/app_routes.dart';
import 'package:project_evently/ui/utlils/dialog_utills.dart';
import 'package:project_evently/widgets/custom_button.dart';
import 'package:project_evently/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
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
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    },
                        icon: Icon( Icons.arrow_back ,color: AppColors.blue,)
                    ),
                  ],
                ),
                SizedBox(height: 24),
                buildAppLogo(context),
                SizedBox(height: 24),
                buildNameTextField(),
                SizedBox(height: 16),
                buildEmailTextField(),
                SizedBox(height: 16),
                buildPasswordTextField(),
                SizedBox(height: 16),
                buildRePasswordTextField(),
                SizedBox(height: 16),
                buildCreateAccountButton(),
                SizedBox(height: 24),
                buildSignUpText(),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildLanguageToggle(themeProvider.mode),
                    Spacer(),
                    buildThemeToggle(themeProvider.mode),
                  ],
                ),

                SizedBox(height: 24),
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
  Widget buildNameTextField() => CustomTextField(
      mode: themeProvider.mode,  /// هنا بقولوا علي حسب المود الي اختاروا
      hint: AppLocalizations.of(context)!.nameHint, ///دية كدا معانها اني بقولوا الايميل مكتوبة بالعربي والانجليزي يعني ونفس الكلام في الباقي
      controller: nameController,
      prefixIcon: AppSvg.icName
  );

  Widget buildEmailTextField() => CustomTextField(
      mode: themeProvider.mode,  /// هنا بقولوا علي حسب المود الي اختاروا
      hint: AppLocalizations.of(context)!.emailHint, ///دية كدا معانها اني بقولوا الايميل مكتوبة بالعربي والانجليزي يعني ونفس الكلام في الباقي
      controller: emailController,
      prefixIcon: AppSvg.icEmail
  );

  Widget buildPasswordTextField() => CustomTextField(
    mode:  themeProvider.mode,
    hint: AppLocalizations.of(context)!.passwordHint,
    controller: passwordController,
    prefixIcon: AppSvg.icPassword,
    isPassword: true,
  );

  Widget buildRePasswordTextField() => CustomTextField(
    mode:  themeProvider.mode,
    hint: AppLocalizations.of(context)!.rePasswordHint,
    controller: rePasswordController,
    prefixIcon: AppSvg.icPassword,
    isPassword: true,
  );


  Widget buildCreateAccountButton() =>
      CustomButton(
        text: AppLocalizations.of(context)!.createAccount,
        onClick: () async {
          showLoading(context);
          try{
          var userCredential =   await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text); /// شلرح في الكشكول


            Navigator.pop(context); ///دا عشان يخفي الloading لان لما بتيجي تعمل الايميل والباسورد صح هيخفي الloading
            Navigator.push(context, AppRoutes.login); ///لو صح يفتح علي LoginScreen عشان يكتب الاكونت هناك ويفتح علي ال home screen
          }on FirebaseAuthException catch(e){
            var message = "Something went wrong , Please try again later " ; /// دية هتظهر لو كتبت الايميل والباسورد غلط اصلا الاتنين غلط هتظهر
            if (e.code == 'weak-password') {
              message = "The password provided is too weak.";
            } else if (e.code == "email-already-in-use") {
              message = "The account already exists for that email.";
            }
            Navigator.pop(context); ///هنا بقا هيظهر لو كتبت الايميل والباسورد غلط او الايميل متكرر او كدا
            showMessage(context , content: message , posButtonTitle: "ok");
          }

        },);

  Widget buildSignUpText() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(AppLocalizations.of(context)!.alreadyHaveAccount , ///دية معناها اني انا عامل التحويل من الانجليزي للعربي وعاملهم في فايل هوا هيحول الكلمة بقا لو لما يجي يغير من انجليزي لعربي نفس الكلام في كلو
        style: Theme
            .of(context)
            .textTheme
            .labelSmall!
            .copyWith(
          fontStyle: FontStyle.italic,
        ),
      ),
      InkWell(
        onTap: (){
          Navigator.push(context, AppRoutes.login);
        },
        child: Text(AppLocalizations.of(context)!.loginButton, style: Theme
            .of(context)
            .textTheme
            .labelMedium!
            .copyWith(
          fontStyle: FontStyle.italic, decoration: TextDecoration.underline,
          decorationColor: AppColors.blue,
        ),
        ),
      ),


    ],
  );
  
  late LanguageProvider languageProvider ; ///هنا انا بعملها late عشان اعرفوا انا هاعملها زي الانا كاتبها عند build
  late ThemeProvider themeProvider ;
  Widget buildLanguageToggle(ThemeMode mode) => AnimatedToggleSwitch<String>.dual(///دية معناها انها زي كونتينر كدا جواة ايكون بيتغير مثلا ما بينها وبتتحرك عشان تغير مثلا لغة
    style: ToggleStyle(
      borderColor: AppColors.blue,
      indicatorColor:  AppColors.white ,
      backgroundColor:  mode == ThemeMode.light ? AppColors.white : AppColors.darkBlue,
    ),
    iconBuilder: (language)=> Image.asset(language == "ar" ? AppAssets.icEg : AppAssets.icUsa ), /// ودية بتحط فيها صورة بقا اي حاجة عايزها تتحرك وتبقا جواة كونتير وشبهة ليها يعني بس بتتحرك
    current: languageProvider.currentLocale,  // ,ودية اللغة الاساسية كدا بقا
    first: "ar",
    second: "en" ,
    onChanged: (language){
      languageProvider.changeLanguage(language) ;/// كدا انا بقولوا اللغة الاساسية تتغير بحسب اللغة الجديدة وكدا شغلنة الصورتين الصغييرين الي تحت ويغير اللغة لما تدوس عليها

    },
  );

  Widget buildThemeToggle(ThemeMode mode) => AnimatedToggleSwitch<ThemeMode>.dual(///دية معناها انها زي كونتينر كدا جواة ايكون بيتغير مثلا ما بينها وبتتحرك عشان تغير مثلا المود
    style: ToggleStyle(
      borderColor: AppColors.blue,
          indicatorColor:  AppColors.white ,
          backgroundColor:  mode == ThemeMode.light ? AppColors.white : AppColors.darkBlue,
    ),
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
