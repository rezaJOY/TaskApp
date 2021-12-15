import 'package:flutter/material.dart';
import 'package:task_app/screen/widgets/task_widget_details.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      elevation: 10,
      child: ListTile(
        //alert, popup, promt

        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskWidgetDetails()));

        },
        onLongPress: (){
          showDialog(
              context: context,
              builder: (ctx){
                return AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: (){

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete, color: Colors.red, size: 25),
                          Text('Delete', style: TextStyle(
                              color: Colors.red, fontSize: 20
                          ),
                          ),
                        ],
                      ),
                    )
                  ],
                );

              }
          );

        },
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: EdgeInsets.only(right: 25),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 2),

            )
          ),
          child: CircleAvatar(
            radius: 20,
            child: Image.asset('assets/icons/connect.png',width: 30),
            backgroundColor: Colors.cyan,
          ),
        ),
        title: Text(
          'Title',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.linear_scale_outlined,color: Colors.cyan),
            Text(
                'The new task has been assigned to you,'
                    ' good luck finishing it|'
                    ' Details of tasks and more',
            maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
        trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.cyan,size: 30),

      ),
    );
  }
}
