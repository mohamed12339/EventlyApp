
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_evently/model/event_dm.dart';
import 'package:project_evently/model/user_dm.dart';


Future<void> addUserToFirestore(UserDm user)async{ /// دية فانكشن لل users
 var userCollection =  FirebaseFirestore.instance.collection(UserDm.collectionName);
 // userCollection.add({}); /// هنا هيعمل id جديد للمستخدم ودا غلط

 var emptyDoc =  userCollection.doc(user.id); ///هنا هنخلية ياخد ال id انا الي بعملوا في doc فاضية مديهالوا
  // return emptyDoc.set({ /// عادي ممكن return or await as you like
  //   "id": user.id, // هنا انا الي بحطوا
  //   "name": user.name,
  //   "email": user.email,
  // });
  emptyDoc.set(user.toJson()); /// هيا نفس الي كاتبو عادي بس بطريقة احسن كتبتهم جواة userDm واسمهم toJson
}


Future<UserDm> getFormUserFirestore(String userId) async {
  /// المسميات الانا كاتبها هنا عادي ممكن تكتب var مش لازم تحفظها المهم اني عارف وبفتكر الحاجة دية بترجع اية
 CollectionReference userCollection =  FirebaseFirestore.instance.collection(UserDm.collectionName);

 DocumentReference userDoc = userCollection.doc(userId);  /// هنا هايجبلي id الي اتخزن عندوا في ال firestore يعني من الاخر هاياخد ال id الي في سطر 10  الانا خزنتوا

 DocumentSnapshot snapshot = await userDoc.get();

 Map json = snapshot.data() as Map ;  /// لازم اعرفوا ال data اية بالظبط فا قولت كدا
 var user = UserDm.fromJson(json); /// دا هوا هوا نفس السطر دا بس بدل ما كنت بكتب هنا لا عملتهم هناك وقولت fromJson
 // UserDm(
 //      id: json["id"],    "id" من الكائن Map اللي اسمه json ,  json["id"] معناها: إني بجيب القيمة اللي مفتاحها
 //      name: json["name"],
 //      email: json["email"],
 //  )
 return user ;
}


 Future<void> addEventToFirestore(EventDm event)async {
   var eventsCollection = FirebaseFirestore.instance.collection(
       EventDm.collectionName);
   /// يبقا الفانكشن دية بتعمل يعني من الاخر بكتب ال collection هنا بدل ما اروح اكتبوا في ال firebase
   /// FirebaseFirestore.instance.collection : شرح في الكشكول
   /// "events"  انا كتبها في  eventdm عشان متلغبطش في حرف ولا حاجة ونفس الكلام في الباقي
//    eventsCollection.add({ /// هنا بتاخد json الي هيا map{} هنا لازم اول حاجة stirng زي ما انا عامل
//      "title" : event.title ,
//      "description" : event.description ,
//      "date" : event.date ,
//      "category" : event.categoryId ,
//      "id" : "",
//      "ownerId" : "" ,
//    });
   var emptyDoc = eventsCollection.doc();/// هنا بعمل doc فاضية ومعاها id بيتحط لوحدوا بس
   event.id = emptyDoc.id; /// انا كدا خزنت ال id معاهم
   emptyDoc.set(event.toJson());
   // emptyDoc.set({/// معني set هنا اني هاحط داتا جواكي مش زي add هاضيفها جواة ال doc الي هوا بيعملها لوحدوا انما هنا انا مديلوا doc فاضية وبقولوا حط فيها بقا
   //   "title": event.title,
   //   "description": event.description,
   //   "date": event.date,
   //   "category": event.categoryId,
   //   "id": emptyDoc.id, // هنا هيحطوا من عندوا
   //   "ownerId": "",
   // });

   ///حل تاني لل id
   ///  var doc = await eventsCollection.add(event.toJson()); عشان تستخدم tojson لازم
   //    eventdm    دية المفروض تكون كاتبها في كدا  toJson
   //Map<String, dynamic> toJson() {
   //     return {
   //       'id': id,
   //       'title': title,
   //       // باقي ...
   //     };
   //   }
   // }
   ///   doc.update({ /// id  كدا انتا حطيت ال  بتاعو لوحدوا برضو
   ///     "id" : doc.id ,
   ///   });
   /// }
 }


Stream<List<EventDm>> getAllEventsFromFirestore(){ /// هنا async* : دية بتبقا بتتعمل مع ال stream ولازم ترجع stream.listen او حاجة حاجة تبقا stream مش ال future  تمم واستخدمنا stream هنا عشان ان يبقا في نفس الوقت الي اتعمل فية ايفنت يظهر علي طول بس شيلتها
  var eventsCollection = FirebaseFirestore.instance.collection(EventDm.collectionName); /// 1. حددنا الـ Collection

  Stream<QuerySnapshot<Map<String , dynamic>>> stream =  eventsCollection.snapshots();  /// 2. طلبنا كل الايفينتات من ال (documents) بس من stream عشان تيجي علي طول في نفس الثانية

  return stream.map((querySnapshot){
    List<EventDm> events = querySnapshot.docs.map((docSnapshot){ /// 3. بدأنا نحول كل doc
      var json = docSnapshot.data(); /// 4. جبنا البيانات من documents كـ Map
      return EventDm.fromJson(json); /// 5. حولناها إلى  EventDm
    }).toList(); /// 6. حولنا الناتج إلى List كاملة
    return events ;
  });

  // yield events ;   /// هنا yield هيا هيا return بالظبط بس بتتسخدم بردو مع ال stream
}



Future<List<EventDm>> getFavoriteEvents() async {  /// الكلام الي هنا هوا هوا كلام getAllEventFromFirestore بالظبط
  var eventsCollection =
  FirebaseFirestore.instance.collection(EventDm.collectionName);
  var querySnapshot = await eventsCollection
      .where("id", whereIn: UserDm.currentUser!.favoriteEvents)  /// هنا بقولوا ان id موجود في اليستة بتاعتة favoriteEvents
      .get();
  List<EventDm> events = querySnapshot.docs.map((docSnapshot) {
    var json = docSnapshot.data();
    return EventDm.fromJson(json);
  }).toList();
  return events;
}


Future addEventFromFavorite(String eventId)async {
  var userCollection = FirebaseFirestore.instance.collection(UserDm.collectionName); /// طبعا انا بقولوا هات ال collection بتاع ال users
  var currentUserDoc = userCollection.doc(UserDm.currentUser!.id);/// وهنا بقولوا هات doc بتاعة ال user الانا هاضيف فيها ال event دلوقتي
  await currentUserDoc.update({"favoriteEvents": FieldValue.arrayUnion([eventId])});/// دية معانها FieldValue.arrayUnion اني بزود حاجة وزي ما انا عامل انا بزود علي الليستة بتاعة ال  (eventId)

  UserDm.currentUser!.favoriteEvents.add(eventId);
}


Future removeEventFromFavorite(String eventId)async{
  var userCollection =  FirebaseFirestore.instance.collection(UserDm.collectionName); /// طبعا انا بقولوا هات ال collection بتاع ال users
  var currentUserDoc = userCollection.doc(UserDm.currentUser!.id); /// وهنا بقولوا هات doc بتاعة ال user الانا هاضيف فيها ال event دلوقتي
  await currentUserDoc.update({"favoriteEvents":FieldValue.arrayRemove([eventId])});  /// دية معانها FieldValue.arrayRemove اني بشيل حاجة وزي ما انا عامل انا بشيل من الليستة بتاعة ال  (eventId)
  UserDm.currentUser!.favoriteEvents.remove(eventId);

}