import 'package:flutter/material.dart';
import 'package:gymbot/setstart.dart';

void main() {
  runApp(const Gymbot());
}

class Gymbot extends StatelessWidget {
  const Gymbot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: _main(),
    );
  }
}

class _main extends StatefulWidget {
  _main({Key? key}) : super(key: key);

  @override
  State<_main> createState() => _mainState();
}

class _mainState extends State<_main> {
  //const FirstRoute({Key? key}) : super(key: key);
  final _list = ['Bench Press', 'Squat', 'DeadLift'];
  var _value = 'Bench Press';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 300,
                height: 60,
                child: DropdownButton(
                  dropdownColor: Color(0x50999999),
                  isExpanded: true,
                  style: TextStyle(fontSize: 35, color: Colors.white),
                  value: _value,
                  items: _list.map(
                    (value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      _value = value.toString();
                    });
                  },
                )),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            Container(
              width: 400,
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                ),
                child: const Text("다음", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => setStart(_value)),
                  );
                },
              ),
            )
          ],
        )));
  }
}
