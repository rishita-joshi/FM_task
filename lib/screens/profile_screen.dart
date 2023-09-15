import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../api_handler/api_handler.dart';
import '../components/custom_list.dart';
import '../model/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          FutureBuilder<ProfileModel>(
              future: APIHandler.getProfile(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.results.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: snapshot
                                      .data!.results[index].picture.medium,
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fitHeight,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                CustomListWidget(
                                  title: "Email:",
                                  title2: snapshot.data!.results[index].email,
                                ),
                                CustomListWidget(
                                  title: "Name:",
                                  title2: snapshot.data!.results[index].name,
                                ),
                                CustomListWidget(
                                  title: "Gender:",
                                  title2: snapshot.data!.results[index].gender,
                                ),
                                CustomListWidget(
                                  title: "DOB:",
                                  title2: snapshot.data!.results[index].dob,
                                ),
                                CustomListWidget(
                                  title: "Number Of passed since registered:",
                                  title2:
                                      snapshot.data!.results[index].registered,
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Text(snapshot.error.toString());
                }
              })
        ],
      ),
    );
  }
}
