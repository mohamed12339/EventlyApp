import 'package:flutter/material.dart';
import 'package:project_evently/data/firestore_utilts.dart';
import 'package:project_evently/model/category_dm.dart';
import 'package:project_evently/model/user_dm.dart';
import 'package:project_evently/ui/utlils/app_assets.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';
import 'package:project_evently/widgets/categories_tabs.dart';
import 'package:project_evently/widgets/event_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  CategoryDm selectedCategory = CategoryDm.homeCategories[0];


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
            UserDm.currentUser!.name, /// كدا بقولوا استخدم الاسم الي عمل اكونت بقا خلاص
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
      onTabSelected: (category){
        selectedCategory = category ;  /// لما المستخدم يدوس علي نوع مثلا يظهر الحاجة بتاعتوا
        setState(() {});
      },
      selectedTabBg: AppColors.white,
      unselectedTabBg: AppColors.blue,
      selectedTabTextColor: AppColors.blue,
      unselectedTabTextColor: AppColors.white,

  );

  buildEventList() => StreamBuilder(   /// دية معملولة مخصوص عشان ترسمللك ال stream اي بقا stream انتا عاملوا في 3 حالات حالة ال stream لسة بيحمل داتا وحالة انة ضرب ايرور وحالة انو انا  بيجيب داتا وكمان هنا ال stream بيتعمل هنا listen لوحدها بس ما اعمللها انا بايدي بس
    stream: getAllEventsFromFirestore(),
    builder: (context , snapshot){  /// طيب هنا في المفروض 3 return دول بتعملوا if condition وهما بيتحط فيهم 3 حالات بتوع الفيوتشير
      if(snapshot.hasError){
        return Center(child: Text(snapshot.error.toString()));
      }else if(snapshot.hasData){ /// في حالة الداتا حملت تمم خلاص هارسم ليستة ال events بس
        var events = snapshot.data!;
        if(selectedCategory.title != "All"){   /// هنا بالمعني لو داس حاجة بدل ال all يبقا  يظهر الحاجة بتاعتوا بس طب لو داس all يظهر كل حاجة
          events =  events.where((event){ /// هنا ان where بترجع ليستة جديدة فا لازم اعرفوا ان دية ليستة ال event
            return event.categoryId == selectedCategory.title ; /// لازم لما مثلا اي حاجة من الي موجودين جنب all يظهر الحاجة بتاعتوا بس
          }).toList();
        }
        return ListView.builder(
            itemCount: events.length ,
            itemBuilder: (context , index ){
              return EventWidget(eventDm: events[index]); /// هنا بقا بقولوا اعملها بيديزين ال eventwidget بس بعتلوا الداتا بقا الي هيا في سطر 98
            });
      }else {
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}

/// هنا كنت عاملها future بس حولتها ل stream عشان الايفينات تيجي في نفس الثانية وكان ال الgetAllEventsFromFirestore بقيت من stream فا مينفعس تتحط في future
// buildEventList() => FutureBuilder(  /// دية معملولة مخصوص عشان ترسمللك ال future اي بقا future انتا عاملوا في 3 حالات حالة الfuture لسة بيحمل داتا وحالة انة ضرب ايرور وحالة انو انا  بيجيب داتا
//   future: getAllEventsFromFirestore(),
//   builder: (context , snapshot){  /// طيب هنا في المفروض 3 return دول بتعملوا if condition وهما بيتحط فيهم 3 حالات بتوع الفيوتشير
//     if(snapshot.hasError){
//       return Center(child: Text(snapshot.error.toString()));
//     }else if(snapshot.hasData){ /// في حالة الداتا حملت تمم خلاص هارسم ليستة ال events بس
//       var events = snapshot.data!;
//       if(selectedCategory.title != "All"){   /// هنا بالمعني لو داس حاجة بدل ال all يبقا  يظهر الحاجة بتاعتوا بس طب لو داس all يظهر كل حاجة
//         events =  events.where((event){ /// هنا ان where بترجع ليستة جديدة فا لازم اعرفوا ان دية ليستة ال event
//           return event.categoryId == selectedCategory.title ; /// لازم لما مثلا اي حاجة من الي موجودين جنب all يظهر الحاجة بتاعتوا بس
//         }).toList();
//       }
//       return ListView.builder(
//           itemCount: events.length ,
//           itemBuilder: (context , index ){
//             return EventWidget(eventDm: events[index]); /// هنا بقا بقولوا اعملها بيديزين ال eventwidget بس بعتلوا الداتا بقا الي هيا في سطر 98
//           });
//     }else {
//       return Center(child: CircularProgressIndicator());
//     }
//   },
// );