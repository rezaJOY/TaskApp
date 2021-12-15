import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_app/auth/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>with SingleTickerProviderStateMixin{
  late AnimationController _animationController;                             //late is used lazily it reads the code only and execute when needed
  late Animation _animation;
  late TextEditingController _fullnameController = TextEditingController(text: '');
  late TextEditingController _emailController = TextEditingController(text: '');
  late TextEditingController _passwordController = TextEditingController(text: '');
  late TextEditingController _designationController = TextEditingController(text: '');
  final _registerFormKey = GlobalKey<FormState>();//controls form
  FocusNode _fullNameFocusNode =FocusNode();   //keyboard open and unlocks the navigation.push
  FocusNode _emailFocusNode =FocusNode();
  FocusNode _passwordFocusNode =FocusNode();
  FocusNode _designationFocusNode =FocusNode();
  bool _obscureText = true;
  @override
  void dispose() {    //dispose means removing after finishing one thing
    // TODO: implement dispose
    _animationController.dispose();
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _designationController.dispose();
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
  void _submitFormRegister(){
    final isValid = _registerFormKey.currentState!.validate();
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
                  'Register', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color:Colors.white),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an Account',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:Colors.white),
                      ),
                      TextSpan(text: '    '),
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()   )),
                        text: 'Login',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color:Colors.blue),
                      ),
                    ],
                  ),

                ),
                SizedBox(height: 40),

                Form(
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty ){
                            return'Please enter valid Name';
                          }else{
                            return null;
                          }

                        },
                        textInputAction: TextInputAction.next,
                        onEditingComplete: ()=>FocusScope.of(context).requestFocus(_emailFocusNode),
                        focusNode: _fullNameFocusNode,
                        keyboardType: TextInputType.name,
                        controller:_fullnameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Full Name',
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
                        onEditingComplete: ()=>FocusScope.of(context).requestFocus(_passwordFocusNode),
                        focusNode: _emailFocusNode,
                        validator: (value){
                          if(value!.isEmpty || !value.contains('@')){
                            return'Please enter valid Email';
                          }else{
                            return null;
                          }

                        },
                        textInputAction: TextInputAction.next,
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
                        textInputAction: TextInputAction.next,
                        onEditingComplete: ()=>FocusScope.of(context).requestFocus(_designationFocusNode),
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
                      SizedBox(height: 20),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        onEditingComplete: ()=>_submitFormRegister(),
                        focusNode: _designationFocusNode,
                        validator: (value){
                          if(value!.isEmpty){
                            return'Please enter valid Designation';
                          }else{
                            return null;
                          }

                        },
                        keyboardType: TextInputType.name,
                        controller: _designationController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Designation',
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

                      SizedBox(height: 40),
                      MaterialButton(
                        onPressed: _submitFormRegister,
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
                              Text('Sign up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold, fontSize: 18

                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.person_add, color: Colors.white,
                              )
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
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<GlobalKey<FormState>>('_loginFormKey', _registerFormKey));
  }
}
