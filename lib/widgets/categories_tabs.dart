import 'package:flutter/material.dart';
import 'package:project_evently/model/category_dm.dart';


class CategoriesTabs extends StatefulWidget {
  final Function(CategoryDm) onTabSelected;/// هنا معناها اني عايز لما المستخدم يدوس علي اي واحدة من tabs فا انا  اعرفها
  final Color selectedTabBg;
  final Color unselectedTabBg;
  final Color selectedTabTextColor;
  final Color unselectedTabTextColor;
  final List<CategoryDm> categories;

  const CategoriesTabs({
    super.key,
    required this.onTabSelected,
    required this.selectedTabBg,
    required this.unselectedTabBg,
    required this.selectedTabTextColor,
    required this.unselectedTabTextColor,
    required this.categories,
  });

  @override
  State<CategoriesTabs> createState() => _CategoriesTabsState();
}

class _CategoriesTabsState extends State<CategoriesTabs> {
 late CategoryDm selectedCategory ;
 @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories[0] ;
 }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length, /// لازم كلمة widget عشان تعرفوا بالحاجة الي مكتوبة في ال statefullwidget جواة ال state
      child: TabBar(
        isScrollable: true , ///شرح دول تحت
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
          labelPadding: EdgeInsets.symmetric(horizontal: 6),
          onTap: (index){
          selectedCategory = widget.categories[index]; /// هنا بقلوا هات من ليستة categories الselectedCategory الي اتداس علية بس
          widget.onTabSelected(selectedCategory) ; /// يبقا هنا ال onTabSelected معناها اني لما المستخدم يدوس علي حاجة تظهر بس كدا
            setState(() {});
          },
          tabs: widget.categories.map((category)=>mapCategoryDmToTab(category , category == selectedCategory)).toList(),/// category == selectedCategory : هنا بقلوا لو المستخدم داس علية يظهر التاب بلون الابيض الي هوا دا الي اختاروا يعني

      ),
    );
  }

  Widget mapCategoryDmToTab(CategoryDm category, bool isSelected){
    return Tab(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(46),
          color: isSelected ? widget.selectedTabBg : widget.unselectedTabBg, /// وللة لو داس عليها هياخد اول selectedTabBg طب ايلس : هياخد ال unselectedTabBg
          border: Border.all(color: widget.selectedTabBg , width: 1 ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(category.image ),
              color: isSelected ? widget.selectedTabTextColor : widget.unselectedTabTextColor,
            ),
            SizedBox(width: 8,),
            Text(category.title,
              style: TextStyle(
                color : isSelected ? widget.selectedTabTextColor : widget.unselectedTabTextColor ,
               fontSize: 16 ,
                fontWeight: FontWeight.bold,
              ),

            ),
          ],
        ),
      ),

    );
  }
}

///return DefaultTabController(
//   length: categories.length,
//   child: TabBar(
//     ...
//   ),
// );
//•	DefaultTabController هو المسئول عن التحكم في تبادل التابات، لازم تحدد length بعدد التابات.
// 	•	TabBar: هو الودجت اللي بيعرض التابات نفسها.

///TabBar
///isScrollable
// بتخلي التابات ممكن تتسحب يمين وشمال بدل ما تكون كلها في صف واحد
// indicatorColor
// لون الخط اللي تحت التاب اللي معمول له اختيار (أنت خليته شفاف)
// dividerColor
// لو فيه خط بين التابات، أنت لغيت الخط هنا
// tabAlignment
// طريقة محاذاة التابات (انت مختارها تبدأ من الشمال start)
// labelPadding
// المسافة حول كل Tab (أنت خليتها 6 بيكسل يمين وشمال فقط)
// tabs
// map ليست التابات نفسها، اللي هنبنيها من categories باستخدام

///categories.map((category)=>mapCategoryDmToTab(category , true)).toList()
//معناها:
// 	1.	خد كل عنصر في categories (وهو CategoryDm)
// 	2.	ابعته لدالة mapCategoryDmToTab
// 	3.	حول كل عنصر لـ Tab
// 	4.	استخدم .toList() علشان ترجعهم كليست Tabs
//  النتيجة: كل عنصر من الكاتيجوريز بيتحول لـ Tab بالشكل اللي انت عايزه

///class _CategoriesTabsState extends State<CategoriesTabs> {
//  late CategoryDm selectedCategory ;
//  @override
//   void initState() {
//     super.initState();
//     selectedCategory = widget.categories[0] ;
//  }

///late CategoryDm selectedCategory;
// 	•	ده تعريف متغير من نوع CategoryDm.
// 	•	حطيت قبله late، يعني:
// “أنا بوعدك  إني هعرف قيمة هذا المتغير قبل ما أستخدمه.”
//
//  ليه استخدمت late؟
//
// علشان ما تديهش قيمة أولية دلوقتي، بس هتديها قيمة في initState.

/// جواة ال intestate
///selectedCategory = widget.categories[0];
//معناها: “أنا أول ما الشاشة تفتح، هاخد أول عنصر في قائمة categories واعتبره هو المختار.”
// 	•	ده بيخليك تقدر تتحكم في مظهر التاب الأول، وتبين إنه هو اللي متعلم (selected)