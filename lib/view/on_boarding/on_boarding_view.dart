import 'package:fitness_tracker/common/color_extension.dart';
import 'package:fitness_tracker/common_widget/on_boarding_page.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;
      setState(() {});
    });
  }

  List pageArr = [
    {
      "title": "Track Your Goal",
      "subtitle":
          "Don't worry if you have trouble determining your goals, we can help you determine your goals and track your goals",
      "image": "assets/images/on_1.png",
    },
    {
      "title": "Get Burn",
      "subtitle":
          "Let's keep burning, to achieve yours goals, it hurts only temporary, if you give up now you will be in pain forever",
      "image": "assets/images/on_2.png",
    },
    {
      "title": "Eat Well",
      "subtitle":
          "Let's start healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
      "image": "assets/images/on_3.png",
    },
    {
      "title": "Improve Sleep\nQuality",
      "subtitle":
          "Improve the quality of your sleep with us, good quality sleep can bring a good mod in morning",
      "image": "assets/images/on_4.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var pOBj = pageArr[index] as Map? ?? {};
              return OnBoardingPage(pOBj: pOBj);
            },
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: TColor.primaryColor1,
                    value: selectPage / 4,
                    strokeWidth: 2,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: TColor.primaryColor1,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  width: 60,
                  height: 60,
                  child: IconButton(
                    onPressed: () {
                      if (selectPage < 4) {
                        selectPage = selectPage + 1;
                        controller.jumpToPage(selectPage);
                        setState(() {});
                      } else {}
                    },
                    icon: Icon(Icons.navigate_next, color: TColor.white),
                    color: TColor.primaryColor1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
