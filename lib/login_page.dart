import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: LoginScreen(),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/images/login_logo.png'),
                ),
                Text('Login'),

                SizedBox(
                  height: 20,
                ),
                Text(
                    'Enter your mobile number we will send you a verification code.'),
                SizedBox(
                  height: 20,
                ),

                //LoginDetails
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Colors.black, width: 1
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                  ),
                ),
                TextButton(onPressed: () {}, child: Text('Submit')),
              ],
            ),
            Container(
                //Divider
              child: Divider(
                height: 2,
              ),
                ),
            SizedBox(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    // style: RoundedRectangleBorder(
                    //
                    // ),

                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,

                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset('assets/images/google_login.png'),
                        ),
                        Text('Continue with Google'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('Don\'t have an Account?'),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                          onTap: () {
                            debugPrint("helo");
                          },
                          child: Text('Register')),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
