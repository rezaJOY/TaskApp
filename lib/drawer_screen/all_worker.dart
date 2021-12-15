import 'package:flutter/material.dart';
import 'package:task_app/screen/widgets/all_user_widgets.dart';
import 'package:task_app/screen/widgets/drawer.dart';


class AllWorker extends StatefulWidget {
  const AllWorker({Key? key}) : super(key: key);

  @override
  _AllWorkerState createState() => _AllWorkerState();
}

class _AllWorkerState extends State<AllWorker> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        leading: Builder(
          builder: (ctx){
            return IconButton(
              onPressed: (){
                Scaffold.of(ctx).openDrawer();
              },
              icon: Icon(Icons.menu,color: Colors.cyan,size: 30),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'All Users',
          style: TextStyle(color: Colors.cyan),
        ),

      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index){
          return AllUserWidgets();
        },

      ),
    );
  }
}
