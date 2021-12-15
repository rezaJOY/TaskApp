
import 'package:flutter/material.dart';

class TaskWidgetDetails extends StatefulWidget {
  const TaskWidgetDetails({Key? key}) : super(key: key);

  @override
  _TaskWidgetDetailsState createState() => _TaskWidgetDetailsState();
}

class _TaskWidgetDetailsState extends State<TaskWidgetDetails> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: Colors.white.withOpacity(0.6),
              leading: TextButton(
                child: const Text(
                  'Back',style: TextStyle(
                    color: Colors.cyan
                ),),
                onPressed: (){Navigator.pop(context);},
              ),

              expandedHeight: 100.0,

              flexibleSpace: const FlexibleSpaceBar(
                title: Text('Human Resources Task',style: TextStyle(
                    color: Colors.cyan,
                  fontSize: 20,fontWeight: FontWeight.bold
                ),),

              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           'Uploaded by',style: TextStyle(
                             color: Colors.red
                         ),),
                         Row(
                           children: [
                             Container(
                               height: 50,width: 50,
                               decoration: BoxDecoration(
                                   shape: BoxShape.circle,
                                   border: Border.all(
                                     width: 3, color: Colors.cyan,
                                   ),
                                   image: const DecorationImage(
                                       image: NetworkImage(
                                           'https://images.pexels.com/photos/10049785/pexels-photo-10049785.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
                                       ),
                                       fit: BoxFit.fill

                                   )
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 children: const [
                                   Text(
                                     'Rick Sanchez',style: TextStyle(
                                       color: Colors.red
                                   ),),
                                   Text(
                                     'Team Leader',style: TextStyle(
                                       color: Colors.red
                                   ),),
                                 ],

                               ),
                             )
                           ],
                         ),

                       ],
                     ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Uploaded on:',style: TextStyle(
                                  color: Colors.red
                              ),),
                              Text(
                                ' Deadline date:',style: TextStyle(
                                  color: Colors.red
                              ),),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: const [
                                Text(
                                  '2021-7-9',style: TextStyle(
                                    color: Colors.red
                                ),),
                                Text(
                                  '2021-7-31',style: TextStyle(
                                    color: Colors.red
                                ),),
                              ],
                            ),
                          ),

                        ],

                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Still have time',style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Done Status:',style: TextStyle(
                              color: Colors.green
                          ),),
                          Row(
                            children: [
                              const Text(
                                'Done',style: TextStyle(
                                  color: Colors.green
                              ),),
                              SizedBox(
                                  width: 30
                              ),
                              const Text(
                                'Not Done Yet',style: TextStyle(
                                  color: Colors.green,
                              ),
                              ),


                              Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            ],
                          ),

                        ],
                      ),

                      SizedBox(height: 20),
                      Divider(thickness: 2),
                      Text(
                        'Task Description:',style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold
                      ),),
                      TextFormField(

                        decoration: const InputDecoration(
                          hintText: 'Description for the task',
                        ),

                      ),
                      SizedBox(height: 10),
                      Center(
                        child: MaterialButton(

                          onPressed: (){},
                          color: Colors.cyan,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text('Add a comment',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold, fontSize: 18

                              ),
                            ),
                          ),

                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 3, color: Colors.cyan,
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://images.pexels.com/photos/10049785/pexels-photo-10049785.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
                                    ),
                                    fit: BoxFit.fill

                                )
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Alan Turing',style: TextStyle(
                                    color: Colors.green
                                ),),
                                Text(
                                  'This is a comment',style: TextStyle(
                                    color: Colors.green,wordSpacing: 2
                                ),),
                              ],


                            ),
                          ),


                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 3, color: Colors.cyan,
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://images.pexels.com/photos/10049785/pexels-photo-10049785.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
                                    ),
                                    fit: BoxFit.fill

                                )
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Alan Turing',style: TextStyle(
                                    color: Colors.green
                                ),),
                                Text(
                                  'This is a comment',style: TextStyle(
                                    color: Colors.green,wordSpacing: 2
                                ),),
                              ],


                            ),
                          ),

                        ],
                      ),

                    ],

                  ),
                ),
              ),
            )


          ],


        ),
      ),
    );



  }
}
