import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
  actions: [
    Icon(Icons.search),
    Icon(Icons.more_vert),
  ],
          backgroundColor: Color.fromARGB(0, 4, 15, 229),
          title: Text("cash book"),
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
            Container(
              child: Row(
                children: [
                  Text("date"),
                  Text("Cash in"),
                  Text("Cash out")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
