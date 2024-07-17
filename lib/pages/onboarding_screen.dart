import 'package:e_commers_app/widgets/app_widget.dart';
import 'package:e_commers_app/widgets/content_model.dart';
import 'package:flutter/material.dart';

import 'auth/sign_up_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (int index){
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: OnboardingContent.content.length,
                itemBuilder: (context, index){
                return Padding(
                    padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.asset(OnboardingContent.content[index].image,
                        height: 450,
                        width: MediaQuery.of(context).size.width/1.5,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 40,),
                      Text(OnboardingContent.content[index].title,style: AppWidget.semiBoldTextFieldStyle(),),
                      const SizedBox(height: 20,),
                      Text(OnboardingContent.content[index].description,style: AppWidget.lightTextFieldStyle(),),
            
                    ],
                  ),
                );
            }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(OnboardingContent.content.length, (index) =>
              buildDots(index, context)
              )
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == OnboardingContent.content.length - 1) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => const SignUp()));
              }
              _controller.nextPage(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.bounceIn);
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: Center(
                child: Text(
                  currentIndex == OnboardingContent.content.length - 1?"Start": "Next",
                  style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Container buildDots(int index,BuildContext context){
    return Container(
      height: 10,
      width: currentIndex == index ? 18 :7,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(6)
      ),
    );
  }
}
