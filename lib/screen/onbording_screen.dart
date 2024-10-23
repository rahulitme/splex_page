import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required Null Function() onContinue, required Null Function() onBack});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<Map<String, String>> onboardingData = [
    {
      "title": "Quality",
      "description":
          "Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain.",
      "image": "assets/farm.png", // Replace with actual image paths
      "buttonColor": "0xFF4CAF50", // Green
    },
    {
      "title": "Convenient",
      "description":
          "Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.",
      "image": "assets/convenient.png", // Replace with actual image paths
      "buttonColor": "0xFFEF6C00", // Orange
    },
    {
      "title": "Local",
      "description":
          "We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time.",
      "image": "assets/local.png", // Replace with actual image paths
      "buttonColor": "0xFFFFA726", // Yellow
    },
  ];

  void _nextPage() {
    if (_currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemCount: onboardingData.length,
          itemBuilder: (context, index) {
            return OnboardingPage(
              title: onboardingData[index]['title']!,
              description: onboardingData[index]['description']!,
              image: onboardingData[index]['image']!,
              buttonColor:
                  Color(int.parse(onboardingData[index]['buttonColor']!)),
              onNext: _nextPage,
            );
          },
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final Color buttonColor;
  final VoidCallback onNext;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.buttonColor,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Top Image
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Title
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        // Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ),

        // Dots Indicator (For current page indication)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Container(
              margin: const EdgeInsets.all(4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: index == _OnboardingScreenState()._currentIndex
                    ? Colors.black87
                    : Colors.black45,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),

        // Join Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text(
              'Join the movement!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),

        // Login Button
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.black45),
          ),
        ),
      ],
    );
  }
}