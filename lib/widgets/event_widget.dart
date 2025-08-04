import 'package:flutter/material.dart';
import 'package:project_evently/data/firestore_utilts.dart';
import 'package:project_evently/model/category_dm.dart';
import 'package:project_evently/model/event_dm.dart';
import 'package:project_evently/model/user_dm.dart';
import 'package:project_evently/ui/utlils/app_assets.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';

class EventWidget extends StatefulWidget {
  final EventDm eventDm; /// هنا انا كاتبها عشان انادي علي الحاجة الي مكتوبه هناك انادي بيها لهنا بس ولما تيجي تسخدبها بقا من كلاس دا هتتظبط علي حسب ال ديزين الانتا عاملوا
  final Function ? onFavClick ; /// اعرف بس في صفحة ال favoritetab داس عليها ولا لا

  const EventWidget({super.key, required this.eventDm ,  this.onFavClick});
  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    CategoryDm categoryDm = CategoryDm.fromTitle(widget.eventDm.categoryId) ;
    return Container(
      margin: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.3 ,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(categoryDm.imageBg),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        buildDate(),
        Spacer(),
        buildTitle(),
      ]
      ),
    );
  }

  buildDate() => Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Color(0xffF2FEFF),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        Text(
          widget.eventDm.date.day.toString(),
          style: TextStyle(
            color: AppColors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
         getMonthName(widget.eventDm.date.month),
          style: TextStyle(
            color: AppColors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );

  String getMonthName(int month) {  /// عملت دية عشان الشهور تتكتب بالطريقة دية
    List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return  months[month - 1];  /// هنا عشان يجيب الشهر بالظبط فا تنقص واحد
  }

  buildTitle() => Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Text(
          widget.eventDm.title,
          style: TextStyle(
            color: AppColors.black, fontSize: 20, fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        buildFavoriteIcon() /// هنا معناها لو الايفنت دا favorite يبقا نحط الصورة دية طب ايلس: يبقا الصورة العادية
      ],
    ),
  );

  Widget buildFavoriteIcon() {
    var isFavorite = UserDm.currentUser!.favoriteEvents.contains(widget.eventDm.id);
    return InkWell(
      onTap: ()async{
        widget.onFavClick?.call(); /// دية معانها اندهلي علي الفانكشن دية ووارد تكون ب null
        isFavorite ? await removeEventFromFavorite(widget.eventDm.id) :  await addEventFromFavorite(widget.eventDm.id);  /// انا عملت await علسهم عشان من الاخر لما تدوس عليهم ميتاخرش عشان لما تدوس تظهر انك دوست في نفس الوقت

        setState(() {});
      },
      child: ImageIcon(AssetImage(
          isFavorite ? AppAssets.favoriteActive : AppAssets.icFavorite), color: AppColors.blue,),
    ); /// هنا معناها لو الايفنت دا favorite يبقا نحط الصورة دية طب ايلس: يبقا الصورة العادية
  }
}
