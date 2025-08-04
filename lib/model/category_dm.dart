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
      imageBg: AppAssets.appHorizontalLogo,
    ),
    CategoryDm(
      image: AppAssets.icSport,
      title: "Sport",
      imageBg: AppAssets.eventSport,
    ),
    CategoryDm(
      image: AppAssets.icBirthday,
      title: "Birthday",
      imageBg: AppAssets.eventBirthdayClub,
    ),
    CategoryDm(
      image: AppAssets.icMeeting,
      title: "Meeting",
      imageBg: AppAssets.eventMeeting,
    ),
    CategoryDm(
      image: AppAssets.icHoliday,
      title: "Holiday",
      imageBg: AppAssets.eventHoliday,
    ),
    CategoryDm(
      image: AppAssets.icBookClub,
      title: "BookingClub",
      imageBg: AppAssets.eventBookingClub,
    ),
    CategoryDm(
      image: AppAssets.icEating,
      title: "Eating",
      imageBg: AppAssets.eventEating,
    ),
    CategoryDm(
      image: AppAssets.icExhibition,
      title: "Exhibition",
      imageBg: AppAssets.eventExhibition,
    ),
    CategoryDm(
      image: AppAssets.icGaming,
      title: "Gaming",
      imageBg: AppAssets.eventGaming,
    ),
    CategoryDm(
      image: AppAssets.icWorkshop,
      title: "WorkShop",
      imageBg: AppAssets.eventWorkshop,
    ),
  ];
  static List<CategoryDm> createEventsCategories = [
    CategoryDm(
      image: AppAssets.icBookClub,
      title: "BookingClub",
      imageBg: AppAssets.eventBookingClub,
    ),
    CategoryDm(
      image: AppAssets.icSport,
      title: "Sport",
      imageBg: AppAssets.eventSport,
    ),
    CategoryDm(
      image: AppAssets.icBirthday,
      title: "Birthday",
      imageBg: AppAssets.eventBirthdayClub,
    ),
    CategoryDm(
      image: AppAssets.icMeeting,
      title: "Meeting",
      imageBg: AppAssets.eventMeeting,
    ),
    CategoryDm(
      image: AppAssets.icHoliday,
      title: "Holiday",
      imageBg: AppAssets.eventHoliday,
    ),
    CategoryDm(
      image: AppAssets.icEating,
      title: "Eating",
      imageBg: AppAssets.eventEating,
    ),
    CategoryDm(
      image: AppAssets.icExhibition,
      title: "Exhibition",
      imageBg: AppAssets.eventExhibition,
    ),
    CategoryDm(
      image: AppAssets.icGaming,
      title: "Gaming",
      imageBg: AppAssets.eventGaming,
    ),
    CategoryDm(
      image: AppAssets.icWorkshop,
      title: "WorkShop",
      imageBg: AppAssets.eventWorkshop,
    ),
  ];

  static CategoryDm fromTitle (String title){
    return homeCategories.firstWhere((category){  /// دية زي اللوب
      /// وبقولوا برضوا لو ان title الانا بعتوا بيساوي اي category من دول خلاص اظهروا صورتوا
     return title == category.title ;
    });
  }
}
