import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shersoft/controller/dataController.dart';
import 'package:shersoft/controller/login.dart';
import 'package:shersoft/view/home/homeWidget/drawer.dart';
import 'package:shersoft/view/home/homeWidget/widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Provider.of<UserController>(context, listen: false).getUserMetaData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0XFFF5F5F5),
      drawer: drawer(context),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: const Color(0XFF0008B4),
        title: Text(
          "Cash Book",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Consumer<Datacontroller>(
            builder:(context, value, child) =>  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['All', 'Daily', 'Weekly', 'Monthly'].map((filter) {
                bool isSelected = value.selected == filter;
                return ElevatedButton(
                  onPressed: () {
                    value.selectedColor(filter);
                    value.getdata(filter);
                  },
                  child: Text(filter),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected? Colors.blue:Colors.grey,
                  ),
                );
              }).toList(),
            ),
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
                  Text(
                    "Date",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    "Cash in",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF30CB76),
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Cash out",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0XFFF31717),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Consumer<Datacontroller>(
              builder: (context, value, child) {
                if (value.filteredData.isEmpty) {
                  return Center(child: Text("No transactions found"));
                }
                return ListView.builder(
                  itemCount: value.filteredData.length,
                  itemBuilder: (context, index) {
                    final data = value.filteredData[index];
                    return Padding(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
           
                                  Text(data.cashIn ?? "N/A"),
                                ],
                              ),
                              Text(
                                data.cashIn ?? '0',
                                style: TextStyle(
                                  color: Color(0XFF30CB76),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data.cashout ?? '0',
                                style: TextStyle(
                                  color: Color(0XFFF31717),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              containerButton(text: "Cash IN", color: Color(0XFF30CB76)),
              containerButton(text: "Cash OUT", color: Color(0XFFC20000)),
            ],
          ),
        ],
      ),
    );
  }
}