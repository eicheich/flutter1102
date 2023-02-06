import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'form.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //The entry point for accessing a [FirebaseFirestore].
    FirebaseFirestore firebase = FirebaseFirestore.instance;

    //get collection from firebase, collection is table in mysql
    CollectionReference siswa = firebase.collection('siswa');

    return Scaffold(
      appBar: AppBar(
        //make appbar with icon
        title: Center(
          child: Text("DATA SISWA"),
        ),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<QuerySnapshot>(
        //data to be retrieved in the future
        future: siswa.get(),
        builder: (_, snapshot) {
          //show if there is data
          if (snapshot.hasData) {
            // we take the document and pass it to a variable
            var alldata = snapshot.data!.docs;

            //if there is data, make list
            return alldata.length != 0
                ? ListView.builder(

                    // displayed as much as the variable data alldata
                    itemCount: alldata.length,

                    //make custom item with list tile.
                    itemBuilder: (_, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          //get first character of name
                          child: Text(alldata[index]['nama'][0]),
                        ),
                        title: Text(alldata[index]['nama'],
                            style: TextStyle(fontSize: 20)),
                        subtitle: Row(
                          children: [
                            Text(alldata[index]['kelas'],
                                style: TextStyle(fontSize: 15)),
                            Text(" ", style: TextStyle(fontSize: 15)),
                            Text(alldata[index]['jurusan'],
                                style: TextStyle(fontSize: 15)),
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                //pass data to edit form
                                MaterialPageRoute(
                                    builder: (context) => FormPage(
                                          id: snapshot.data!.docs[index].id,
                                        )),
                              );
                              // Get.toNamed("/form",
                              //     arguments: (context) => FormPage(
                              //           id: snapshot.data!.docs[index].id,
                              //         ));
                            },
                            icon: Icon(Icons.arrow_forward_ios_rounded)),
                      );
                    })
                : Center(
                    child: Text(
                      'No Data',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
          } else {
            return Center(child: Text("Loading...."));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/form");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
