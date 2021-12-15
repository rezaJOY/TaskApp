import 'package:flutter/material.dart';

class AllUserWidgets extends StatefulWidget {
  const AllUserWidgets({Key? key}) : super(key: key);

  @override
  _AllUserWidgetsState createState() => _AllUserWidgetsState();
}

class _AllUserWidgetsState extends State<AllUserWidgets> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      elevation: 10,
      child: ListTile(
        // alert, popup, prompt
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        leading: Container(
          padding: EdgeInsets.only(right: 25),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 1),
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22,

            child: Image.asset('assets/images/profile.png',scale: 5),
          ),
        ),
        title: Text(
          'User Name',
          maxLines: 2,overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.linear_scale_outlined,color: Colors.teal,),
            Text(
              'Lorem Ipsum is simply dummy text of the'
                  ' printing and typesetting industry. '
                  'Lorem Ipsum has been the industry',
              maxLines: 2,overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: (){},
          icon:Icon(
              Icons.mail_outline,
              color: Colors.cyan,
              size: 30
          ),
        ),
      ),
    );
  }
}
