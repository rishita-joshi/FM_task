import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../api_handler/api_handler.dart';

class ImageDisplay extends StatefulWidget {
  const ImageDisplay({super.key});

  @override
  State<ImageDisplay> createState() => _ImageDisplayState();
}

class _ImageDisplayState extends State<ImageDisplay> {
  var imageUrl;

  @override
  void initState() {
    getImageApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image"),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: SizedBox(
                height: 150,
                width: 150,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) => Center(
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  getImageApi();
                },
                child: Text("Get New Image")),
          ),
        ],
      ),
    );
  }

  getImageApi() {
    APIHandler.getImage().then((value) => {
          setState(() {
            imageUrl = value.message;
          })
        });
  }
}
