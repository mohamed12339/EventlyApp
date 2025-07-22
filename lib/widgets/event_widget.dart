import 'package:flutter/material.dart';
import 'package:project_evently/model/event_dm.dart';
import 'package:project_evently/ui/utlils/app_assets.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';

class EventWidget extends StatelessWidget {
  final EventDm eventDm;

  const EventWidget({super.key, required this.eventDm});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.3 ,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(eventDm.image),
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
    child: Text(
      eventDm.date,
      style: TextStyle(
        color: AppColors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );

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
          eventDm.title,
          style: TextStyle(
            color: AppColors.black, fontSize: 20, fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        ImageIcon(AssetImage(
            eventDm.isFavorite ? AppAssets.favoriteActive : AppAssets.icFavorite)) /// هنا معناها لو الايفنت دا favorite يبقا نحط الصورة دية طب ايلس: يبقا الصورة العادية
      ],
    ),
  );
}
