import 'package:project_evently/ui/utlils/app_assets.dart';

class CategoryDm {
  String image;

  String title;

  String imageBg; /// دية عملتها عشان الصورة الي هاتتحطط جواة ال create event

  CategoryDm({required this.image, required this.title, required this.imageBg});

  static List<CategoryDm> homeCategories = [
    CategoryDm(
      image: AppAssets.icAll,
      title: "All",
      imageBg: AppAssets.birthdayClub,
    ),
    CategoryDm(
      image: AppAssets.icSport,
      title: "Sport",
      imageBg: AppAssets.birthdayClub,
    ),
    CategoryDm(
      image: AppAssets.icBirthday,
      title: "Birthday",
      imageBg: AppAssets.birthdayClub,
    ),
    CategoryDm(
      image: AppAssets.icSport,
      title: "Meeting",
      imageBg: AppAssets.birthdayClub,
    ),
    CategoryDm(
      image: AppAssets.icHome,
      title: "Holiday",
      imageBg: AppAssets.birthdayClub,
    ),
    CategoryDm(
      image: AppAssets.icBookClub,
      title: "BookingClub",
      imageBg: AppAssets.birthdayClub,
    ),
  ];
  static List<CategoryDm> createEventsCategories = [

    CategoryDm(
      image: AppAssets.icBookClub,
      title: "BookingClub",
      imageBg: AppAssets.birthdayClub,
    ),
    CategoryDm(
      image: AppAssets.icSport,
      title: "Sport",
      imageBg: AppAssets.birthdayClub,
    ),
    CategoryDm(
      image: AppAssets.icBirthday,
      title: "Birthday",
      imageBg: AppAssets.birthdayClub,
    ),
    CategoryDm(
      image: AppAssets.icSport,
      title: "Meeting",
      imageBg: AppAssets.birthdayClub,
    ),
    CategoryDm(
      image: AppAssets.icHome,
      title: "Holiday",
      imageBg: AppAssets.birthdayClub,
    ),

  ];
}
