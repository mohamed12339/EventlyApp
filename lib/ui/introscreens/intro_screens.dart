import 'package:flutter/material.dart';
import 'package:project_evently/l10n/app_localizations.dart';
import 'package:project_evently/model/intro_dm.dart';
import 'package:project_evently/ui/providers/theme_provider.dart';
import 'package:project_evently/ui/utlils/app_assets.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';
import 'package:project_evently/ui/utlils/app_routes.dart';
import 'package:provider/provider.dart';


class IntroScreen extends StatefulWidget {

  const IntroScreen({super.key});

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    final List<IntroDM> introData = [
      IntroDM(
        title:  AppLocalizations.of(context)!.introTitle1,
        subtitle: AppLocalizations.of(context)!.introSubtitle1,
        imagePath: (mode)=> mode == ThemeMode.light ? AppAssets.screen1 : AppAssets.screen1  ,
      ),
      IntroDM(
        title:AppLocalizations.of(context)!.introTitle2,
        subtitle: AppLocalizations.of(context)!.introSubtitle2,
        imagePath:(mode)=> mode == ThemeMode.light ? AppAssets.screen2 : AppAssets.screen2Dark,
      ),
      IntroDM(
          title: AppLocalizations.of(context)!.introTitle3,
          subtitle: AppLocalizations.of(context)!.introSubtitle3,
          imagePath:(mode)=> mode == ThemeMode.light ? AppAssets.screen3 : AppAssets.screen3Dark
      ),

    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                    icon: Icon( Icons.arrow_back ,color: AppColors.blue,)
                ),
              ],
            ),
            Image.asset(AppAssets.eventlyIntroScreen),
            SizedBox(height: 20),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: introData.length,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },

                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Center(child: Image.asset(introData[index].imagePath(themeProvider.mode), height: 300)),
                        SizedBox(height: 20),
                        Padding(
                          padding:  EdgeInsets.all(16),
                          child: Text(
                            introData[index].title,
                            style: Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding:  EdgeInsets.all(16),
                          child: Text(
                            introData[index].subtitle,
                            style: Theme.of(context).textTheme.labelSmall,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: currentPage > 0
                        ? () {
                      pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      foregroundColor:  AppColors.blue,
                      backgroundColor: AppColors.white,
                    ),
                    child: Icon(Icons.arrow_back , color: AppColors.blue,),
                  ),
                  Row(
                    children: List.generate(
                      introData.length,
                          (index) => Container(
                        margin: EdgeInsets.all(4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: currentPage == index
                              ? AppColors.blue
                              :  AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: currentPage < introData.length - 1
                        ? () {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } : (){
                      Navigator.push(context, AppRoutes.login);/// عملت دية عشان بعد اnext يخش علي الصفحة الي فيها الحاجات بقا بتاعة الLogin بس كدا
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor:  AppColors.blue,
                      backgroundColor: AppColors.white
                    ),
                    child: Icon(Icons.arrow_forward_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
