import 'package:flutter/material.dart';
import 'package:task_app/screen/widgets/drawer.dart';
import 'package:task_app/screen/widgets/task_widget.dart';



class TaskScreen extends StatefulWidget {

  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<String>taskCategoryList = [
    'Business',
    'Business',
    'Business',
    'Business',

  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),

      appBar: AppBar(
        leading: Builder(
          builder: (ctx){
            return IconButton(onPressed: (){
              Scaffold.of(ctx).openDrawer();
            },
                icon: Icon(Icons.menu, color: Colors.cyan,size: 30),
            );
          },
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Task', style: TextStyle(
           color: Colors.cyan, fontSize: 23
        ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              _showTaskCategoryDialog(size: size);
            },
            icon: Icon(Icons.filter_list_rounded, color: Colors.cyan, size: 30),
          )
        ],

      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            return TaskWidget();

          },


      ),

    );



  }
  _showTaskCategoryDialog({required Size size}) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Task Category',
              style: TextStyle(fontSize: 20, color: Colors.red),),
            content: Container(
             // width: 300, height: 400,
              width: size.width*0.8,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: taskCategoryList.length,
                itemBuilder: (ctxx, index) {
                  return InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.check_circle_outline, color: Colors.red),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            taskCategoryList[index],
                            style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context)? Navigator.pop(context):null;
                },
                child: Text('Close'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Cancel Filter'),
              ),
            ],
          );
        }
    );
}


}
