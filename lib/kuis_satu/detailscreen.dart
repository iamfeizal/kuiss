import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'game_store.dart';
import 'dart:html' as html;

class DetailScreen1 extends StatefulWidget {
  final GameStore game;

  const DetailScreen1({Key? key, required this.game}) : super(key: key);

  @override
  State<DetailScreen1> createState() => _DetailScreen1State();
}

class _DetailScreen1State extends State<DetailScreen1> {
  @override
  bool toggle = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.game.name}"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                toggle = !toggle;
              });
            },
            icon: (toggle)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {
               html.window.open(widget.game.linkStore, "");
            },
            icon: Icon(Icons.share),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: (MediaQuery
                .of(context)
                .size
                .height) / 3,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.game.imageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 6.0,
                      )],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      widget.game.imageUrls[index],
                      width: 200,
                      height: 210,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
            alignment: Alignment.center,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.lightBlue.shade700,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 50,),
                  Text(widget.game.name,
                    style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Text(widget.game.about,),
                  ),
                  Text("tanggal rilis --> ${widget.game.releaseDate}",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Text("Genre Game --> ${widget.game.tags}",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Text("Harga Game --> ${widget.game.price}",
                    style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  Text(" Average : ${widget.game.reviewAverage} | Count : ${widget.game.reviewCount}",
                    style:
                    TextStyle(color: Colors.lightBlue, fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 50,),
                  // OutlinedButton(onPressed: (){
                  //   //Navigator.pop(context);
                  //   // _launchURL(widget.game.linkStore);
                  // }, child: Text('Lihat Toko')
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}
