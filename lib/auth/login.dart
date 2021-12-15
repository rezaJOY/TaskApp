import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_app/auth/forgot_password.dart';
import 'package:task_app/auth/register.dart';
import 'package:task_app/screen/task_screen.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {  //for animation must add with singleTiTickerProviderStateMixin
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                //.50=50% //0.1 = 10%
                   SizedBox(height: size.height * 0.1),
                Text(
                  'Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color:Colors.white),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:Colors.white),
                    ),
                   TextSpan(text: '    '),
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()
                      )),
                      text: 'Register',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color:Colors.blue),
                    ),
                  ],
                ),

                ),
                SizedBox(height: 40),

                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onEditingComplete: ()=>FocusScope.of(context).requestFocus(_passwordFocusNode),
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        validator: (value){
                          if(value!.isEmpty || !value.contains('@')){
                            return'Please enter valid Email';
                          }else{
                            return null;
                          }

                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.blueAccent),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        onEditingComplete: ()=>_submitFormLogin(),
                        focusNode: _passwordFocusNode,
                        obscureText: _obscureText,
                        validator: (value){
                          if(value!.isEmpty || value.length <7){
                            return'Please enter valid Password';
                          }else{
                            return null;
                          }

                        },
                        controller: _passwordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                _obscureText ? Icons.visibility: Icons.visibility_off,color: Colors.white,
                              )),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.blueAccent),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder:(context)=>ForgotPassword()
                              ));
                            },
                            child: Text(
                              'Forgotten Password?', style: TextStyle(fontSize: 17,fontStyle: FontStyle.italic, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      MaterialButton(
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
                              Text('Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold, fontSize: 18,

                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.login_outlined, color: Colors.white,
                              ),

                            ],
                          ),
                        ),

                      ),
                    ],
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
