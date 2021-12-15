import 'package:flutter/material.dart';
import 'package:task_app/screen/widgets/drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      backgroundColor: Colors.white.withOpacity(0.8),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Stack(
          children: [


            Card(
              margin: const EdgeInsets.all(30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),

              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 50),
                    Center(
                      child: Text('Name', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,

                      ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text('Rick Joined Since 08-11-2021', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,

                      ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(thickness: 1),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Contact Info', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,

                      ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Email:', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,

                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Text('ricksanchez@gmail.com', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,

                          ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Phone Number:', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,

                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Text('+8801687252708', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,

                          ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(thickness: 1),
                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.cyan,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.add_ic_call_outlined, color: Colors.cyan,),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.cyan,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.alternate_email_outlined,color: Colors.cyan,),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.cyan,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.add_ic_call_outlined,color: Colors.cyan,),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Divider(thickness: 1),
                    SizedBox(height: 50),

                    Center(
                      child: MaterialButton(

                        onPressed: (){Navigator.pop(context);},
                        color: Colors.cyan,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text('Logout',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold, fontSize: 18

                            ),
                          ),
                        ),

                      ),
                    ),


                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 8, color: Colors.cyan,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.pexels.com/photos/10049785/pexels-photo-10049785.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
                      ),
                      fit: BoxFit.fill

                    )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
