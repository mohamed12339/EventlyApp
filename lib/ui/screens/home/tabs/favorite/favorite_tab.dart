import 'package:flutter/material.dart';
import 'package:project_evently/data/firestore_utilts.dart';
import 'package:project_evently/widgets/event_widget.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Expanded(child: buildEventsList())],
    );
  }

  buildEventsList() => FutureBuilder( /// هنا عشان نخلي المستخدم لما يدوس علي اي event يبقا يتحط في ال favorite بس 
      future: getFavoriteEvents(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          var events = snapshot.data!;
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              return EventWidget(eventDm: events[index] , onFavClick: (){
                setState(() {});
              },);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}
