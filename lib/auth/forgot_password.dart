import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_app/auth/register.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;                             //late is used lazily it reads the code only and execute when needed
  late Animation _animation;
  late TextEditingController _emailController = TextEditingController(text: '');
  late TextEditingController _passwordController = TextEditingController(text: '');
  FocusNode _emailFocusNode =FocusNode();
  FocusNode _passwordFocusNode =FocusNode();
  bool _obscureText = true;
  final _loginFormKey = GlobalKey<FormState>();   //controls form
  @override
  void dispose() {    //dispose means removing after finishing one thing
    // TODO: implement dispose
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  void initState() {      //auto Trigger, when build then it will execute
    // TODO: implement initState
    _animationController = AnimationController(vsync:this,duration: Duration(seconds: 20));   //vsync keeps the track of screen
    _animation =
    CurvedAnimation(parent: _animationController, curve: Curves.bounceInOut)..addListener(() {  //add_listener means notify
      setState(() {

      });
    })..addStatusListener((animationStatus) {
      if(animationStatus == AnimationStatus.completed){
        _animationController.reset();
        _animationController.forward();   //forward means loop
      }
    });
    _animationController.forward();
    super.initState();
  }
  void _submitFormLogin(){
    final isValid = _loginFormKey.currentState!.validate();
    print('Invalid $isValid ');
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "https://images.pexels.com/photos/4145354/pexels-photo-4145354.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            placeholder: (context, url) => Image.asset(
              'assets/images/wallp.jpg',
              fit: BoxFit.fill,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value, 0),
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: ListView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Forgot Password', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color:Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 90),

                Text(
                  'Enter Email Address', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color:Colors.white),
                ),

                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:Colors.blueAccent),
                    ),
                ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _loginFormKey,
                  child: MaterialButton(
                    onPressed: _submitFormLogin,
                    color: Colors.blue,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Reset Password',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold, fontSize: 18

                            ),
                          ),

                        ],
                      ),
                    ),

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
