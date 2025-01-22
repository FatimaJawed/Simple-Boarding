import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Onboarding Screen',
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final List<OnboardingClass> onboardingList = OnboardingClass.onboardingList;

  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex < onboardingList.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      debugPrint("End of onboarding");
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingList.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Boarding(
                  title: onboardingList[index].title,
                  description: onboardingList[index].description,
                  image: onboardingList[index].image,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextPage,
        backgroundColor: const Color(0xFF027fff),
        child: Icon(
          _currentIndex < onboardingList.length - 1
              ? Icons.arrow_forward_ios
              : Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Boarding extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final int index;

  const Boarding({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            OnboardingClass.onboardingList.length,
            (indicatorIndex) => Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: indicatorIndex == index
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OnboardingClass {
  final String title;
  final String description;
  final String image;

  OnboardingClass({
    required this.title,
    required this.description,
    required this.image,
  });

  static List<OnboardingClass> onboardingList = [
    OnboardingClass(
      title: "Discover New Opportunities",
      description: "Take your business to the next level with our tools.",
      image: "assets/1.png", // Ensure the image is in the correct location
    ),
    OnboardingClass(
      title: "Grow Your Business",
      description: "Build meaningful connections with customers.",
      image: "assets/2.png", // Ensure the image is in the correct location
    ),
    OnboardingClass(
      title: "Simplify Your Workflow",
      description: "Save time with our smart tools.",
      image: "assets/3.png", // Ensure the image is in the correct location
    ),
  ];
}
