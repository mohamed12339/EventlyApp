import 'package:flutter/material.dart';
import 'package:project_evently/ui/screens/home/tabs/favorite/favorite_tab.dart';
import 'package:project_evently/ui/screens/home/tabs/home/home_tab.dart';
import 'package:project_evently/ui/screens/home/tabs/map/map_tab.dart';
import 'package:project_evently/ui/screens/home/tabs/profile/profile_tab.dart';
import 'package:project_evently/ui/utlils/app_assets.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';
import 'package:project_evently/ui/utlils/app_routes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;/// هنا انا عملت فريابل عشان لما النستخدم يختار ايكون
  List<Widget> tabs = [
    HomeTab(),
    FavoriteTab(),
    MapTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex], ///دية معاناها علي حسب لما يجي يدوس علي اي واحدة بقا يدوس عليها تفتحلوا tab دية
      floatingActionButton: buildFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, ///دية بيخلية في النص عند bottomNavigation
        bottomNavigationBar: buildBottomNavigationBar()
    );
  }


  buildBottomNavigationBar() => Theme(
    data: Theme.of(context).copyWith(canvasColor: AppColors.blue),
    child: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        currentIndex = index;/// هنا بقا بقولوا لما الستخم يدوس علي الايكون تكبر عنهم كدا وسويتها بالانديكس
        setState(() {});
      },

      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              currentIndex == 0 ? AppAssets.homeActive : AppAssets.icHome,
              ///  دية معناها  (bool) currentIndex==0  لو الايكون الاولي بتساوي صفر يظهر الصورة بتاعتها الي هيا ال active  بس والباقي كدا بردو
            ),
          ),
          label: "home",
        ),

        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              currentIndex == 1 ? AppAssets.mapActive : AppAssets.icMap,
            ),
          ),
          label: "map",
        ),

        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              currentIndex == 2 ? AppAssets.favoriteActive : AppAssets.icFavorite,
            ),
          ),
          label: "favorite",
        ),

        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              currentIndex == 3 ? AppAssets.profileActive : AppAssets.icProfile,
            ),
          ),
          label: "profile",
        ),
      ],
    ),
  );

  buildFab() =>FloatingActionButton(
    backgroundColor: AppColors.blue,
      shape: StadiumBorder(side: BorderSide(color: Colors.white)),  /// دية عشان ال floating يبقا مدور بس وال side حوالينها ابيض كدا
      onPressed: (){
      Navigator.push(context, AppRoutes.addEvent); /// لما تيجي تدوس علي علامة الزائد تخش علي دية بس
      },
      child: Icon(Icons.add)
  );
}
