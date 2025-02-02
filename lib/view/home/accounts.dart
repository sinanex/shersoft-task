import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shersoft/controller/localdb.dart';
import 'package:shersoft/controller/login.dart';
import 'package:shersoft/view/home/homepage.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              final data = value[index];
              return ListTile(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        width: double.infinity,
                        height: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Provider.of<UserController>(context,
                                          listen: false)
                                      .loginUser(
                                          email: data.email ?? '',
                                          password: data.password ?? '')
                                      .then((value) {
                                    if (value != null) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Homepage(),
                                          ));
                                    }
                                  });
                                },
                                child: accountContainer(
                                    context, Colors.green, "switch account")),
                            accountContainer(
                                context, Colors.red, "remove account"),
                          ],
                        ),
                      );
                    },
                  );
                },
                title: Text(data.email ?? ""),
              );
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text("All Accounts"),
      ),
    );
  }

  Container accountContainer(BuildContext context, Color color, String text) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.8,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
