import 'package:flutter/material.dart';
import 'package:project_evently/model/category_dm.dart';
import 'package:project_evently/ui/utlils/app_assets.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';
import 'package:project_evently/widgets/categories_tabs.dart';
import 'package:project_evently/widgets/custom_button.dart';
import 'package:project_evently/widgets/custom_text_field.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            ///spacing: 16, هنا كدا هايحططلك لوحدوا مسافة ما بين كل حاجة لوحدوا عشان كلهم نف المسافة فا استخدمت دية بس sizedbox بس
            children: [
              buildCategoryImage(),
              SizedBox(height: 16,),
              buildCategoryTabs(),
              SizedBox(height: 16,),
              buildTitleTextField(),
              SizedBox(height: 16,),
              buildDescriptionTextField(),
              SizedBox(height: 16,),
              buildEventDate(),
              SizedBox(height: 16,),
              buildEventTime(),
              SizedBox(height: 16,),
              buildEventLocation(),
              SizedBox(height: 24,),
              buildAddEventButton(),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() => AppBar( /// انا هنا هتلاقية واخد لون و size وستايل من الاخر لا دا في كل appbar هاعملوا لية عشان انا عامل فايل appTheme جواة  ال appBarTheme وكدا وكدا عامل في ال maindart معرفوا الtheme
    title: Text(
      "Create Event",
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back, color: AppColors.blue),
    ),
  );

  buildCategoryImage() =>ClipRRect(    /// دية لو عايز تدي صورة  padding and margin and  borderRadius كدا اعمل clipRRect  وهوا هيعملها لوحدها بس ووممكن ب container and decoration بس دية احسن عشان هتظبطللك ال padding and margin
    borderRadius: BorderRadius.circular(16),
    child: Image.asset(AppAssets.birthdayClub),
  );

  buildCategoryTabs() => CategoriesTabs(
      categories: CategoryDm.createEventsCategories,
      onTabSelected: (category){},
      selectedTabBg: AppColors.blue,
      unselectedTabBg: AppColors.white,
      selectedTabTextColor: AppColors.white,
      unselectedTabTextColor: AppColors.blue,
  );

  buildTitleTextField() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text("Title" , style: Theme.of(context).textTheme.labelSmall),
      SizedBox(height: 8,),
      CustomTextField(
          hint: "Event Title",
          prefixIcon: AppSvg.icTitle,
          mode: ThemeMode.light
      ),
    ],
  );


  buildDescriptionTextField() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text("Description" , style: Theme.of(context).textTheme.labelSmall),
      SizedBox(height: 8,),
      CustomTextField(
          hint: "Event Description",
          minLines: 5,
          mode: ThemeMode.light,
      ),
    ],
  );
  buildEventDate() => Row(
    children: [
      ImageIcon(AssetImage(AppAssets.icEventDate)),
      SizedBox(height: 8, width: 8,),
      Text("Event Date",style: Theme.of(context).textTheme.labelSmall),
      Spacer(),
      Text("Choose Date" ,style: Theme.of(context).textTheme.labelMedium)


    ],
  );

  buildEventTime() => Row(
    children: [
      ImageIcon(AssetImage(AppAssets.icEventTime)),
      SizedBox(height: 8, width: 8,),
      Text("Event Time",style: Theme.of(context).textTheme.labelSmall),
      Spacer(),
      Text("Choose Time" ,style: Theme.of(context).textTheme.labelMedium)
    ],
  );

  buildEventLocation()  => Container();

  buildAddEventButton()  => CustomButton(text: "Add Event", onClick: (){});
}
