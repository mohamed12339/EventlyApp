class EventDm {
  String title;

  String image;

  String date;

  bool isFavorite;

  String description ;

  String time ;

  double lat ;

  double lng ;

  EventDm({
    required this.title,
    required this.image,
    required this.isFavorite,
    required this.date,
    required this.description,
    required this.time,
    required this.lat ,
    required this.lng
  });
}
