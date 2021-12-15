import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/drawer_screen/all_worker.dart';
import 'package:task_app/drawer_screen/profile_screen.dart';
import 'package:task_app/drawer_screen/upload_task.dart';
import 'package:task_app/screen/task_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.cyan
            ),
            child: Column(
              children: [
                Flexible(
                  flex: 2,

                  child: ClipOval(
                    child: Image.asset('assets/images/drawerPIC.png'),

                  )

                ),
                SizedBox(height: 20),
                Flexible(
                    flex: 1,
                    child: Text('Rick Sanchez', style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic,
                ),
                    ))
              ],
            ),
          ),
          SizedBox(height: 20),
          _listTitle(label: 'All Tasks', fct: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskScreen()));
          }, icon: Icons.task_outlined),
          _listTitle(label: 'Add Task', fct: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadTask()));
            }, icon: Icons.note_add_outlined),
          _listTitle(label: 'Registered Users', fct: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> AllWorker()
            ));
          }, icon: Icons.supervised_user_circle_outlined),
          _listTitle(label: 'My Account', fct: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
          }, icon: Icons.account_circle_outlined),



          Divider(
            thickness: 2,
          ),
          _listTitle(label: 'Log Out', fct: (){
            _logout(context);
          }, icon: Icons.logout_outlined),



        ],
      ),
    );
  }
  void _logout(context){
  showDialog(
      context: context,
      builder: (context){
    return AlertDialog(
      content: Text(
        'Do you want to logout', style: TextStyle(
        fontSize: 18
      ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('No',style: TextStyle(
              fontSize: 18, color: Colors.red
          ),),
        ),

        TextButton(
          onPressed: () {},
          child: Text('Yes',style: TextStyle(
              fontSize: 18, color: Colors.green
          ),),
        ),


      ],

    );
  }
  );

  }


  Widget _listTitle(
  {required String label, required Function fct, required IconData icon}
      ){
    return ListTile(
      onTap: (){
        fct();
      },
      leading: Icon(icon, color: Colors.cyan),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 22,fontStyle: FontStyle.italic, color: Colors.cyan
        ),
      ),

    );
  }



}
