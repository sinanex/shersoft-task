import 'package:flutter/material.dart';
import 'package:shersoft/view/home/homeWidget/widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
      drawer: Drawer(
        
      ),
      appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(onPressed: (){
                Scaffold.of(context).openDrawer();
              }, icon: Icon(Icons.menu,color: Colors.white,));
            }
          ),
        centerTitle: true,
      actions: [
        Icon(Icons.search,color: Colors.white,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.more_vert,color: Colors.white,),
        ),
      ],
       backgroundColor: const Color(0XFF0008B4),
        title: Text("",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          
        ),),
      ),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(onPressed: (){}, child: Text('all')),
              ElevatedButton(onPressed: (){}, child: Text('today')),
              ElevatedButton(onPressed: (){}, child: Text('week')),
              ElevatedButton(onPressed: (){}, child: Text('monthly')),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
            decoration: BoxDecoration(
                color: Color(0XFFFFFFFF),
                borderRadius: BorderRadius.circular(8),
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Date",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),),
                  Text("Cash in",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF30CB76),
                    fontSize: 15,
                  ),),
                  Text("Cash out",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0XFFF31717),
                  ),)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
            height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0XFFFFFFFF),
              ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Thursday"),
                      Text('12-08-2021  05:32 AM')
                    ],
                  ),
                  Text("2000"),
                  Text("2000")
                ],
              ),
            ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
            height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0XFFFFFFFF),
              ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Thursday"),
                      Text('12-08-2021  05:32 AM')
                    ],
                  ),
                  Text("2000"),
                  Text("2000"),
                  
                ],
              ),
            ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              containerButton(text: "Cash IN",color: Color(0XFF30CB76)),
              containerButton(text: "Cash OUT",color: Color(0XFFC20000)),
            ],
          ),
        ],
      ),
    );
  }


}
