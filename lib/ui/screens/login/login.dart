import 'package:flutter/material.dart';
import 'package:project_evently/ui/utlils/app_assets.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';
import 'package:project_evently/widgets/custom_button.dart';
import 'package:project_evently/widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              buildGoogleLogin(),
              buildLanguageToggle(),
            ],
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
      hint: "Email",
      prefixIcon: AppSvg.icEmail
  );

  Widget buildPasswordTextField() => CustomTextField(
    hint: "Password",
    prefixIcon: AppSvg.icPassword,
    isPassword: true,
  );

  Widget buildForgetPassword() => Text(///حاجة انا عملت هنا اني بحط الcontext كنت كاتبو في البارميتر بتاعها  انا بعرفوا عشان انا فيstatelessWidget مش في ال statefulWidget لو انا فيها مكنتش هعرفها الكونتكست زي ما انا عامل
        " Forget Password? ",
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
      );

  Widget buildLoginButton() => CustomButton(text: "Login", onClick: (){},);

  Widget buildSignUpText() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(" Don’t Have Account ?  " ,
        style: Theme
          .of(context)
          .textTheme
          .labelSmall!
          .copyWith(
          fontStyle: FontStyle.italic,
          ),
      ),
      Text("Create Account", style: Theme
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
      Expanded(child: Divider(endIndent: 20, indent: 20,)) ,
      SizedBox(width: 2,),
      Text("Or" , style: Theme.of(context).textTheme.labelMedium),
      SizedBox(width: 2,),
      Expanded(child: Divider(endIndent: 20, indent: 20,)),

    ],
  );

  Widget buildGoogleLogin() =>
      CustomButton(text: "Login With Google",
         icon:Image.asset(AppAssets.icGoogle) ,
        onClick: () {},
        backgroundColor: AppColors.white,
        textColor: AppColors.blue,);

  Widget buildLanguageToggle() => Container();
}
