import 'package:flutter/material.dart';

class ViewPhoto extends StatefulWidget {
  const ViewPhoto({
    super.key,
  });

  @override
  State<ViewPhoto> createState() => _ViewPhotoState();
}

class _ViewPhotoState extends State<ViewPhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Card(
              
            )



          ],
        ),
      ),
    );
  }
}
