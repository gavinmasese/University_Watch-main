import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final String markdownSource = "";
  Future<List<Map<String, dynamic>>> handleDocuments() async {
    List<Map<String, dynamic>> documents = [];
    try {
      // Fetch data from the main collection (users)
      QuerySnapshot usersQuerySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      // Iterate through each document in the main collection
      for (var userDoc in usersQuerySnapshot.docs) {
        if (userDoc['title'] != null && userDoc['title'] == "Student") {
          // Fetch data from the subcollection (imagesAndDescription) for each document
          QuerySnapshot imagesQuerySnapshot =
              await userDoc.reference.collection('imagesAndDescription').get();

          // Create a map to hold data from both the main collection and subcollection
          Map<String, dynamic> combinedData = {};

          // Add data from the main collection
          if (userDoc.data() != null) {
            combinedData.addAll(userDoc.data()! as Map<String, dynamic>);
          }

          // Add data from the subcollection
          combinedData['imagesAndDescription'] = imagesQuerySnapshot.docs
              .map((imageDoc) => imageDoc.data())
              .toList();

          // Add the combined data to the list
          documents.add(combinedData);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
    return documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'University Watch',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('images/logo.jpg')),
                const Expanded(
                  child: Markdown(
                      shrinkWrap: true,
                      data:
                          '''## About \n ### Description:\n University Watch is a social media platform designed to facilitate communication within university communities. \n Whether you're a student, faculty member, or staff member, University Watch provides a centralized platform for sharing timely information, organizing events, and connecting with others on campus.\n\n ### Mission: \nOur mission at University Watch is to enhance communication and collaboration within university communities, fostering a supportive environment for learning, engagement, and innovation.\n\n- Terms of Service\n- Privacy Policy\n- Copyright © 2024 University Watch. All rights reserved.\n\n ### Connect with us on social media:\n- Facebook: [University Watch]\n- Twitter: [University Watch]\n- Instagram: [@universitywatch]\n\n ### University Watch utilizes the following third-party resources:\n- Firebase (Authentication and Database)\n- Flutter (Mobile App Framework)\n- Icons by FontAwesome\n'''),
                ),
                // Column(
                //   children: [
                //     const Text('Email us at gavinmasese911@gmail.com'),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         SizedBox(
                //             height: 100,
                //             width: 100,
                //             child: Image.asset('images/logo.jpg')),
                //       ],
                //     ),
                // ElevatedButton(onPressed: () {}, child: const Text("data")),
                // SizedBox(
                //     height: 300,
                //     child: FutureBuilder<List<Map<String, dynamic>>>(
                //         future:
                //             handleDocuments(), // Call the function to fetch data
                //         builder: (context, snapshot) {
                //           if (snapshot.connectionState == ConnectionState.waiting) {
                //             return CircularProgressIndicator(); // Show loading indicator while fetching data

                //           } else if (snapshot.hasError) {
                //             return Text('Error: ${snapshot.error}');
                //           } else {
                //             // Display fetched data
                //             return ListView.builder(
                //               itemCount: snapshot.data!.length,
                //               itemBuilder: (context, index) {
                //                 // Extract data for each document
                //                 Map<String, dynamic> documentData =
                //                     snapshot.data![index];
                //                 print(documentData);
                //                 // Access fields within the document
                //                 String title = documentData[''];
                //                 // Display the document data
                //                 return ListTile(
                //                   title: Text(title),
                //                 );
                //               },
                //             );
                //           }
                //         }))
                //   ],
                // ),
              ]),
        ));
  }
}
