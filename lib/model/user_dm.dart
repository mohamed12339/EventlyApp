class UserDm {
  static const String collectionName = "users";
  static UserDm? currentUser ; /// دا هيتغير في register and login
 late String id;

 late String name;

 late  String email;

 late List<String> favoriteEvents ; /// دية عشان اعرف الحاجات المستخدم الي داس عليها وخلاها favorite عندوا

 // String password; /// اوعا تخزن باسورد مينفعش تكون عارف باسورد المستخدم

  UserDm({required this.id, required this.name, required this.email , required this.favoriteEvents});

  UserDm.fromJson(Map json){
    id = json["id"]; // وبنادي علي السطر 25
    name = json["name"]; // نفس الكلام
    email = json["email"];
    List<dynamic> favList = json['favoriteEvents'] ?? [];
    favoriteEvents = favList.map((id) => id.toString()).toList(); /// انا حولت ليستة favoiteEvents من string الي ليستة dynamic
  }

  Map<String , dynamic> toJson(){
    return {
      "id": id, // هنا انا الي بحطوا
      "name": name,
      "email": email,
      "favoriteEvents" : favoriteEvents ,

    };

  }
}
