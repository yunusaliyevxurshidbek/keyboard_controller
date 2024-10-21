import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keyboard Controller"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              for (int i = 1;i <= 15;i++)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "type smth",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                      labelText: "$i",
                    ),
                    onTap: (){
                      _scrollToFocusedTextField(i);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );



  }

  void _scrollToFocusedTextField(int i) {
    // Har bir TextFieldga fokus bo'lganda, kerakli joyga skroll qiling
    final position = (i - 1) * 40.0;
    _scrollController.animateTo(
      position,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

  }
}


