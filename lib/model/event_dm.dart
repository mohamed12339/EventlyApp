import 'package:cloud_firestore/cloud_firestore.dart';

class EventDm {

  static const String collectionName = "events";

 late String id ;

  late String title;

  late String categoryId;  /// عشان مخزنش صور وكدا ومعملمش export لصور كتير

  late DateTime date;

  late String description ;

  late double? lat ; ///? :معناها null يعني

  late double? lng ;

  late String ownerId ;


  EventDm({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.date,
    required this.description,

    required this.ownerId,
     this.lat ,
     this.lng
  });


  EventDm.fromJson(Map json) {
    id = json["id"];
    title = json["title"];
    categoryId = json["categoryId"];
   var timeStamp =  json["date"] as Timestamp ; /// انا هنا حولت DateTime ل timeStamp عشان ال firebase معندهاش حاجة اسمها datetime عندها اسمها timestamp
   date = timeStamp.toDate(); /// قولتلو هاتهولي date بس
    description = json["description"];
    lat = json["lat"];
    lng = json["lng"];
    ownerId = json["ownerId"];
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'categoryId': categoryId,
      'date': date,
      'description': description,
      'lat': lat,
      'lng': lng,
      'ownerId': ownerId,
    };
  }
}
