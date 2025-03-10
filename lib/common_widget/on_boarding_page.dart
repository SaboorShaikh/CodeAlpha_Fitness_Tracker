import 'package:flutter/material.dart';
import 'package:fitness_tracker/common/color_extension.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.pOBj});

  final pOBj;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      width: media.width,
      height: media.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            pOBj["image"].toString(),
            width: media.width,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: media.height * 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              pOBj["title"].toString(),
              style: TextStyle(
                color: TColor.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              pOBj["subtitle"].toString(),
              style: TextStyle(color: TColor.gray, fontSize: 14),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
