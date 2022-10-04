import 'package:flutter/material.dart';
import 'package:kuis_praktikum_124200015/kuis_satu/game_store.dart';
import 'detailscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("List Game"),
    ),
    body: ListView.builder(
      itemBuilder: (context, index) {
        final GameStore gameStore = gameList[index];
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen1(game: gameStore);
            }));
            // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(username: place.name)));
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.lightBlue.shade700,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40,),
                  Image.network(gameStore.imageUrls[0], width: 300,),
                  SizedBox(height: 15,),
                  Text(gameStore.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 40,
                    ),),
                  SizedBox(height: 10,),
                  Text(gameStore.price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        );
      },
      itemCount: gameList.length,
    ),
  );
}
}
