import 'package:flutter/material.dart';
import 'package:project_evently/data/firestore_utilts.dart';
import 'package:project_evently/model/category_dm.dart';
import 'package:project_evently/model/event_dm.dart';
import 'package:project_evently/model/user_dm.dart';
import 'package:project_evently/ui/utlils/app_assets.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';
import 'package:project_evently/ui/utlils/dialog_utills.dart';
import 'package:project_evently/widgets/categories_tabs.dart';
import 'package:project_evently/widgets/custom_button.dart';
import 'package:project_evently/widgets/custom_text_field.dart';

class AddEvent extends StatefulWidget {
  final EventDm ? eventToEdit ;
  const AddEvent({super.key, this.eventToEdit});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  CategoryDm selectedCategory = CategoryDm.createEventsCategories[0]; /// دية انا عملتها لية عشان اعرف المستخدم داس علي sport  وكدا او داس علي حاجة تانية  وكدا كدا  هيا بدايتها 0 عشان دا اول حاجة في اللسيت
  DateTime selectedDate = DateTime.now(); /// what is DateTime : هيا هيا انما  (داتا تيم) بتشيل ايام وشهور وسنين وكلمة (ناو) دية معناها اني بقولوا هات الوقت بتاع دلوقتي يعني لما تيجي تفتح يكون جايبللك من يوم النهارة والوقت دلوقتي   duration بس الاختلاف ان هنا كان بيشيل وقت وثواني وساعات
  TimeOfDay selectedTime = TimeOfDay.now() ;  /// دا بيبقا شايل وقت زي 9.30 am or pm كدا مثلا لو شيلت (ناو) هتلاقي حاجة جواة ساعة ودقيقة

  @override
  void initState() {
    super.initState();
    if (widget.eventToEdit != null) {
      // لو تعديل
      titleController.text = widget.eventToEdit!.title;
      descriptionController.text = widget.eventToEdit!.description;
      selectedCategory = CategoryDm.createEventsCategories.firstWhere(
            (cat) => cat.title == widget.eventToEdit!.categoryId,
        orElse: () => CategoryDm.createEventsCategories[0],
      );
      selectedDate = widget.eventToEdit!.date;
      selectedTime = TimeOfDay(
        hour: selectedDate.hour,
        minute: selectedDate.minute,
      );
    }
  }
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
    child: Image.asset(selectedCategory.imageBg),
  );

  buildCategoryTabs() => CategoriesTabs(
      categories: CategoryDm.createEventsCategories,
      onTabSelected: (category){
        selectedCategory = category ; /// طيب تتغير امتي لما المستخدم يدوس علي اي category بس كدا
        setState(() {});
      },
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
          mode: ThemeMode.light,
          controller: titleController ,
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
          controller: descriptionController ,
      ),
    ],
  );
  buildEventDate() => InkWell(
    onTap: ()async{
     selectedDate = (await showDatePicker(context: context, /// معني  showDatePicker دا عاملة زي calender الي فيها يوم اية وشهر في سنة اية وكدا
          firstDate: DateTime.now(), /// يبقا كدا بقولوا ان showDatePicker هيظهر من دلوقتي اول ما تفتح الابلكيشن
          initialDate: selectedDate,
          lastDate: DateTime.now().add(Duration(days: 365))))?? selectedDate; /// دية كدا بقولوا هينهي بعد سنة بس
      /// الانا عملتو هنا اني بقولوا لما يجي ينختار يوم يلاقي انو لما يفتح تاني showdatepicker يلاقي علي اليوم الي اختاروا
    },
    child: Row(
      children: [
        ImageIcon(AssetImage(AppAssets.icEventDate)),
        SizedBox(height: 8, width: 8,),
        Text("Event Date",style: Theme.of(context).textTheme.labelSmall),
        Spacer(),
        Text("Choose Date" ,style: Theme.of(context).textTheme.labelMedium)


      ],
    ),
  );

  buildEventTime() => InkWell(
    onTap: ()async{
      selectedTime = (await showTimePicker(
        context: context,
          initialTime: selectedTime,
      ))?? selectedTime ;/// هنا بقولوا لو future جابلي null يبقا سيب اخر وقت المستخدم اختاروا بس
    },
    child: Row(
      children: [
        ImageIcon(AssetImage(AppAssets.icEventTime)),
        SizedBox(height: 8, width: 8,),
        Text("Event Time",style: Theme.of(context).textTheme.labelSmall),
        Spacer(),
        Text("Choose Time" ,style: Theme.of(context).textTheme.labelMedium)
      ],
    ),
  );

  buildEventLocation()  => Container();

  buildAddEventButton()  => CustomButton(
      text: widget.eventToEdit==null ? "Add Event" : "Update Event",
      onClick: ()async{
    showLoading(context);
    selectedDate = DateTime( /// انا هنا عملت ان ال firebase معندهاش ال timeofday فا خزنت الوقت جواة ال datetime بس لان هوا ساعة ودقيقة
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
    EventDm eventDm = EventDm(
        id: widget.eventToEdit?.id ?? "", // دا كدا كدا خلاص ال firestore بتعملوا فا مش لازم
        title: titleController.text,
        categoryId: selectedCategory.title,
        date: selectedDate,
        description: descriptionController.text,
       ownerId: UserDm.currentUser!.id,
    );
    if(widget.eventToEdit ==null){
      await addEventToFirestore(eventDm);
    }else{
      await updateEventInFirestore(eventDm);
    }
    setState(() {});
   Navigator.pop(context); // to hide showLoading only .
   Navigator.pop(context); // close screen addEvent only .
  });
}
