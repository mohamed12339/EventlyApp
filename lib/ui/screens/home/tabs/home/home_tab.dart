import 'package:flutter/material.dart';
import 'package:project_evently/model/category_dm.dart';
import 'package:project_evently/model/event_dm.dart';
import 'package:project_evently/ui/utlils/app_assets.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';
import 'package:project_evently/widgets/categories_tabs.dart';
import 'package:project_evently/widgets/event_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
        children: [
          buildHeader(),
          Expanded(
              child: buildEventList())
        ]
    )
    );
  }

  buildHeader() => Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.blue,
      borderRadius: BorderRadius.only(///هنا انا radius للحواف بس
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
    ),
    child: Column(
        children: [
      buildUserInfo(),
      SizedBox(height: 9,),
      buildCategoriesTabs()
    ]
    ),
  );

  buildUserInfo() => Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome Back ✨",
            style: TextStyle(fontSize: 14, color: AppColors.white),
          ),
          Text(
            "Mohamed Magdy",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Image.asset(AppAssets.icMap),
              SizedBox(width: 5),
              Text(
                "Cairo , Egypt",
                style: TextStyle(fontSize: 14, color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
      Spacer(),
      Icon(Icons.light_mode_outlined, color: AppColors.white), ///دول جوا ال row الكبير
      SizedBox(width: 10),
      Image.asset(AppAssets.icEN),
    ],
  );

  buildCategoriesTabs() => CategoriesTabs(
      categories: CategoryDm.homeCategories,
      onTabSelected: (category){},
      selectedTabBg: AppColors.white,
      unselectedTabBg: AppColors.blue,
      selectedTabTextColor: AppColors.blue,
      unselectedTabTextColor: AppColors.white,

  );

  buildEventList() =>
      ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) =>
            EventWidget(eventDm: EventDm(title: "This is a Birthday Party",
                image: AppAssets.birthdayClub,
                isFavorite: false,
                date: " 21 \n nov ",
                description: "description",
                time: "time",
                lat: 0,
                lng: 0)),

      );
}
