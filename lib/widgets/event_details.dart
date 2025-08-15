import 'package:flutter/material.dart';
import 'package:project_evently/data/firestore_utilts.dart';
import 'package:project_evently/model/category_dm.dart';
import 'package:project_evently/model/event_dm.dart';
import 'package:project_evently/ui/utlils/app_assets.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';
import 'package:project_evently/ui/utlils/app_routes.dart';

class EventDetails extends StatelessWidget {
  final EventDm eventDm;
  const EventDetails({super.key, required this.eventDm});

  @override
  Widget build(BuildContext context) {
    CategoryDm categoryDm = CategoryDm.fromTitle(eventDm.categoryId) ;
    return Scaffold(
      appBar: AppBar(
        title:  Text("Event Details"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back ,color: AppColors.blue,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit , color: AppColors.blue,),
            onPressed: () {
              Navigator.push(context, AppRoutes.addEvent(eventDm));
            },
          ),
          IconButton(
            icon:  Icon(Icons.delete , color:  AppColors.red ,),
            onPressed: () async {
              await deleteEventFromFirestore(eventDm.id) ; /// كدا هيشيل الايفيت
              if (!context.mounted) return;  /// هنا معنا ال mounted هنا بقولوا اتاكد ان المستخدم معملش حاجة غريبة زي ما انا حاطط الثانتين دول ميكونش قفل ال app ميكونش عمل حاجة تانية مثلا وبردوا بستخدمها لان ال ؤخىفثءف بتدي انزار كدا مع future and async لية لان دية بيتبقا حاجة شغالة وبتاخد وقت وهيا بتشتغل وكمان بردوا مع ال await لان دول بياخدوا وقت شوية فا لازم تعمل mounted
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImageBg(categoryDm),
            SizedBox(height: 16),

            buildTitleOfEvent(context),
            SizedBox(height: 16),

            // التاريخ والوقت
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color:AppColors.blue),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children:  [
                  ImageIcon(AssetImage(AppAssets.icEventDate) , color: AppColors.blue,),
                  SizedBox(width: 8),
                  Text(
                    eventDm.date.day.toString(),
                    style: TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    getMonthName(eventDm.date.month),
                    style: TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Text(
                    formatTime(eventDm.date),
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                ],
              ),
            ),

             SizedBox(height: 20),
            // الوصف
            Text(
              "Description",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              eventDm.description ,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  ClipRRect buildImageBg(CategoryDm categoryDm) {
    return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              categoryDm.imageBg, // علي حسب انا اخترت اية الصورة يعني
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          );
  }
  buildTitleOfEvent(BuildContext context){
    // عنوان الحدث
   return SizedBox(
      width: double.infinity,
      child: Text(
        eventDm.title ,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
  String getMonthName(int month) {  /// عملت دية عشان الشهور تتكتب بالطريقة دية
    List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return  months[month - 1];  /// هنا عشان يجيب الشهر بالظبط فا تنقص واحد
  }
  String formatTime(DateTime date) {
    int hour = date.hour;
    int minute = date.minute;
    String period = "AM";

    if (hour >= 12) {
      period = "PM";
      if (hour > 12) hour -= 12; // تحويل 13 -> 1
    } else if (hour == 0) {
      hour = 12; // 00:xx = 12 AM
    }

    String minuteStr = minute.toString().padLeft(2, '0');
    return "$hour:$minuteStr $period";
  }

}
