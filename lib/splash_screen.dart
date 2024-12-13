import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() => runApp(MaterialApp(home:SplashScreen(),));

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context)=>Container(color: Colors.black,)));
    });
    // FutureBuilder(
    //   future: ,
    //   builder: Navigator.of(context).push(MaterialPageRoute(builder: ()=>HomeScreen(),)),
    // )

  }
  @override
  void dispose(){
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors :[Colors.deepPurpleAccent, Colors.blueAccent], begin: Alignment.topRight, end: Alignment.bottomLeft)

        ),
        child: Column(
          children: [
            SizedBox(child: Image.asset('assets/images/splash_screen_logo.png')),
            Text('VOICE FOR HER'),
            Text('Because You Deserve Peace of Mind'),
          ],
        ),
      ),
    );
  }
}
