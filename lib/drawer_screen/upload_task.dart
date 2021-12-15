import 'package:flutter/material.dart';
import 'package:task_app/screen/widgets/drawer.dart';

class UploadTask extends StatefulWidget {
  const UploadTask({Key? key}) : super(key: key);

  @override
  _UploadTaskState createState() => _UploadTaskState();
}

class _UploadTaskState extends State<UploadTask> {
  List<String> taskCategoryList =[
    'Business',
    'Business',
    'Business',
    'Business',
  ];
  TextEditingController _taskController =TextEditingController(text: 'Catergory');
  TextEditingController _titleController =TextEditingController(text: 'Title');
  TextEditingController _descriptionController =TextEditingController(text: 'Description');
  TextEditingController _dateController =TextEditingController(text: 'Pickup a date');
  DateTime? picked;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _taskController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(elevation: 0,backgroundColor: Colors.cyan),
      resizeToAvoidBottomInset: false,

        body: Padding(

          padding: const EdgeInsets.all(10),
          child: Card(

            elevation: 2,

            child: Column(

              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: Text('All Fields are Required', style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 20, color: Colors.cyan
                    ),),
                  ),
                ),
                const Divider(thickness: 2),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _listTitle(label: 'Task Category *'),
                        SizedBox(height: 10),
                        _textFormField(
                          valueKey: 'Task Category', enabled: false,
                          fct: (){
                            _showTaskCategoryDialog(size: size);
                          },maxLength: 80, controller: _taskController
                        ),
                        _listTitle(label: 'Task Title *'),
                        const SizedBox(height: 10),
                        _textFormField(
                            valueKey: 'Task Title', enabled: false,
                            fct: (){},maxLength: 80, controller: _titleController
                        ),
                        _listTitle(label: 'Task Description *'),
                        const SizedBox(height: 10),
                        _textFormField(
                            valueKey: 'TaskDescription', enabled: true,
                            fct: (){},maxLength: 100, controller: _descriptionController
                        ),
                        _listTitle(label: 'Deadline Date *'),
                        const SizedBox(height: 10),
                        _textFormField(
                            valueKey: 'Deadline Date', enabled: false,
                            fct: (){
                              _pickDateDialog();
                            },maxLength: 80, controller: _dateController
                        ),
                        const SizedBox(height: 40),
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
                              child: Text('Upload',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold, fontSize: 18

                                ),
                              ),
                            ),

                          ),
                        )


                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
  void _pickDateDialog()async{
    picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        const Duration(days: 0),
      ),
      lastDate: DateTime(2100),
    );
    setState(() {
      _dateController.text = '${picked!.year}-${picked!.month}-${picked!.day}';
    });
  }
  _showTaskCategoryDialog({required Size size}) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Task Category',
              style: TextStyle(fontSize: 20, color: Colors.red),),
            content: SizedBox(
              // width: 300, height: 400,
              width: size.width*0.8,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: taskCategoryList.length,
                itemBuilder: (ctxx, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _taskController.text = taskCategoryList[index];
                      });
                    },
                    child: Row(
                      children: [
                         Icon(Icons.check_circle_outline, color: Colors.red),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            taskCategoryList[index],
                            style: const TextStyle(
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
                child:  Text('Close'),
              ),
              TextButton(
                onPressed: () {},
                child:  Text('Cancel Filter'),
              ),
            ],
          );
        }
    );
  }
Widget _textFormField({required String valueKey,
                       required TextEditingController controller,
                       required bool enabled,
                       required Function fct,
                       required int maxLength,
}){

    return  InkWell(
      onTap: ()
    {
      fct();
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextFormField(
          textInputAction: TextInputAction.done,
          controller: controller,
          maxLines: valueKey=='TaskDescription'? 3:1,
          maxLength: maxLength,
           enabled: enabled,
          key: ValueKey(valueKey),
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.withOpacity(0.2),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color:Colors.white),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color:Colors.cyan),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color:Colors.red),
            ),
          ),
        ),
      ),
    );
}
 Widget _listTitle({required label}){
    return  Text(label, style: const TextStyle(
        fontWeight: FontWeight.bold,fontSize: 16, color: Colors.cyan),);
 }
}
