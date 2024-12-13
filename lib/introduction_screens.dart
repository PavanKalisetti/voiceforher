import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // List of introduction pages
  final List<Map<String, String>> _introPages = [
    {
      "title": "Welcome to MyApp",
      "description": "Discover features and functionalities tailored for you.",
      "image": "assets/intro1.png", // Replace with actual image paths
    },
    {
      "title": "Stay Organized",
      "description": "Track and manage your tasks effortlessly.",
      "image": "assets/intro2.png",
    },
    {
      "title": "Achieve Your Goals",
      "description": "Set goals and track your progress easily.",
      "image": "assets/intro3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for swiping through screens
          PageView.builder(
            controller: _pageController,
            itemCount: _introPages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final page = _introPages[index];
              return Container(
                decoration: const BoxDecoration(
              gradient: LinearGradient(colors :[Colors.deepPurpleAccent, Colors.blueAccent], begin: Alignment.topRight, end: Alignment.bottomLeft)

              ),
                child: Stack(

                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset('assets/images/introduction_${index+1}.png'),
                    ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(48.0),
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image.asset(
                          //   page["image"]!,
                          //   height: 300,
                          //   width: 300,
                          //   fit: BoxFit.cover,
                          // ),
                          // SizedBox(height: 20),
                          Text(
                            page["title"]!,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              page["description"]!,
                              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ]
                ),
              );
            },
          ),

          // Page indicator and navigation
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skip button
                if (_currentPage < _introPages.length - 1)
                  TextButton(
                    onPressed: () {
                      // Navigate directly to the last page
                      _pageController.animateToPage(
                        _introPages.length - 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text("Skip"),
                  )
                else
                  SizedBox(width: 60), // To balance spacing

                // Page indicators
                Row(
                  children: List.generate(
                    _introPages.length,
                        (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _currentPage == index ? 16 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.blue
                            : Colors.grey[400],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),

                // Next or Get Started button
                if (_currentPage < _introPages.length - 1)
                  TextButton(
                    onPressed: () {
                      // Navigate to the next page
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text("Next"),
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the main app/home screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text("Get Started"),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy HomeScreen to demonstrate navigation
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(child: Text("Welcome to the Home Screen!")),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: IntroScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
