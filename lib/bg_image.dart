import 'package:flutter/material.dart';


class BgImage extends StatelessWidget {
  const BgImage({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Image(image: AssetImage("images/bg.jpg"),
      fit: BoxFit.cover,
        color: Colors.black.withOpacity(0.5),
        colorBlendMode: BlendMode.darken,
    );
  }
}
