import 'package:flutter/material.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Function() onClick;
  final Color textColor;
  final Widget ? icon ; ///خليتها widget عشان اقدر احط صورة لو انتا جايب الايكون من برة

  const CustomButton({
    super.key,
    this.backgroundColor = AppColors.blue, /// ممكن تغيروا عادي لما تيجي تبعتوا مش لازم دا دا الاساس الي هوا هيحطوا عايز تغيروا عادي وهوا دا ال namedparamters {}
    required this.text,
    required this.onClick,
    this.icon ,
    this.textColor = AppColors.white, /// ممكن تغيروا عادي لما تيجي تبعتوا مش لازم دا دا الاساس الي هوا هيحطوا عايز تغيروا عادي وهوا دا ال namedparamters {}
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(icon != null) icon! , ///انا هنا بقولوا لو انا حطيللك ايكون خلاص حطها محطهاش خد ال text بس
          if(icon != null) SizedBox(width: 10,),/// هنا انا بقولوا لو فية ايكون جنب الtext حط جنبها sizedbox بس
          Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: textColor), ///انا هنا كتبت الtext color شوف اللون الانا بعتهولك وحطوا لان كل الزااير اللون الكلمة الي جواة متغير
          ),
        ],
      ),
    );


  }
}
