import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String? prefixIcon;
  final bool isPassword;
  final ThemeMode mode ; ///عرفتها عشان استخدمها في تغير لون المود
  final int minLines  ;

  const CustomTextField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.isPassword = false,
    required this.mode ,
    this.minLines = 1 ,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true ;
  @override
  Widget build(BuildContext context) {
    return TextField(///ازاي عرف الborder والحاجات التانبة الي موجود في file apptheme عشان عرفتهم في ال main dart
      minLines: widget.minLines,
      maxLines: widget.minLines + 1 ,  /// حاجة مهمة عشان هتضرب ايرور بعد لما تعمل min lines
// فانا عملت maxlines وعرفوا واعمل minlines +1 عشان ميضربش ايرور وتكبر حتة customtextfield بتاعة description تمم
      decoration: InputDecoration(/// فية شرح تحت

        prefixIcon: widget.prefixIcon == null ? null : Container(

            margin: EdgeInsets.symmetric(horizontal:  12),
            child: SvgPicture.asset(widget.prefixIcon!, color: widget.mode == ThemeMode.light ? AppColors.gray : AppColors.white,)),/// prefixIcon!: دية معناها علي حسب انا بعتللك اية

        suffixIcon: widget.isPassword ? InkWell(
            onTap: (){
              obscureText = !obscureText ; /// هنا انا يقولوا لو كنت مخفي اتعكس واظهر لما تدوس علي ايكون العين
              setState(() {});
            },
            child: Icon( obscureText ? Icons.visibility_off : Icons.remove_red_eye , color: widget.mode == ThemeMode.light ? AppColors.gray : AppColors.white,) , ) : null, ///هنا بقولوا لو انتا مخفي او مش كات حاجة  اظهر ايكون العين الي عليها شرطة ايلس : ظاهر خلي العين من غير شرطة  وانتا بتدوس عليها
        hintText: widget.hint,

      ),
      obscureText: widget.isPassword ? obscureText : false, /// لو كاتب حاجة هتبقا مش ظاهرة وانتا بتكتب  ودا بعيد عن ايكون العين لو انتا باسورد خليك obscure الي هيا مخفي ايلس : يبقا false   

    );
  }
}
///شرح
///prefixIcon: prefixIcon == null? null : SvgPicture.asset(AppSvg.icEmail)
// دية معناها لو انا بعتللك برفيكس ب null هتعمل مش هاعمل حاجة فتبقا ب null طب ايلس : هابعتللك صورة مثلا زي الsvg هيا نفس image.asset بس دية باجكش بتحملها وتعملها زي دية كدا بالظبط

/// suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : null ,
//هنا بقولوا لو انا شغال بباسورد دلوقتي حطتيلي ايمون العين لو انا مش  بباسور او مكتبتش باسورد  خلية ب null

/// hintStyle: Theme.of(context).textTheme.titleSmall,/// شرحها في الكشكول
///
/// color: widget.mode == ThemeMode.light ? AppColors.gray : AppColors.white,
/// دية بقولو لون المود light حط اللون دا طب لو ايلس : حط اللون التاني

