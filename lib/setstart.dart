import 'package:flutter/material.dart';
import 'package:gymbot/camera.dart';

// ignore: must_be_immutable, camel_case_types
class setStart extends StatefulWidget {
  final String value;
  setStart(this.value, {Key? key}) : super(key: key);
  int weight = 35;
  int rep = 10;
  int set = 3;
  int rest = 10;

  @override
  State<setStart> createState() => _startState();
}

class _startState extends State<setStart> {
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
            Text(widget.value, //운동종류
                style: const TextStyle(fontSize: 50, color: Colors.white)),
            const Padding(padding: EdgeInsets.only(bottom: 40)),
            Row(
              //weight - 35 +     Row (text container(row(button text button)))
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Weight",
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                const Padding(padding: EdgeInsets.only(right: 30)),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(width: 5, color: const Color(0x005c59ff)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                widget.weight -= 1;
                              });
                            },
                            child: const Text(
                              '-',
                              style: TextStyle(fontSize: 30),
                            )),
                        const Padding(padding: EdgeInsets.only(right: 30)),
                        Text("${widget.weight} kg",
                            style: const TextStyle(fontSize: 30)),
                        const Padding(padding: EdgeInsets.only(right: 30)),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                widget.weight += 1;
                              });
                            },
                            child: const Text(
                              '+',
                              style: TextStyle(fontSize: 30),
                            )),
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(bottom: 90)),
              ],
            ), //한세트

            Row(
              //Rep(s) - 10회 +     Row (text container(row(button text button)))
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Rep(s)",
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                const Padding(padding: EdgeInsets.only(right: 30)),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(width: 1, color: const Color(0x005c59ff)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                widget.rep -= 1;
                              });
                            },
                            child: const Text(
                              '-',
                              style: TextStyle(fontSize: 30),
                            )),
                        const Padding(padding: EdgeInsets.only(right: 30)),
                        Text("${widget.rep} 회",
                            style: const TextStyle(fontSize: 30)),
                        const Padding(padding: EdgeInsets.only(right: 30)),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                widget.rep += 1;
                              });
                            },
                            child: const Text(
                              '+',
                              style: TextStyle(fontSize: 30),
                            )),
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(bottom: 90)),
              ],
            ), //한세트

            Row(
              //Set(s) - 3세트 +     Row (text container(row(button text button)))
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Set(s)",
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                const Padding(padding: EdgeInsets.only(right: 30)),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(width: 1, color: const Color(0x005c59ff)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                widget.set -= 1;
                              });
                            },
                            child: const Text(
                              '-',
                              style: TextStyle(fontSize: 30),
                            )),
                        const Padding(padding: EdgeInsets.only(right: 30)),
                        Text("${widget.set} 세트",
                            style: const TextStyle(fontSize: 30)),
                        const Padding(padding: EdgeInsets.only(right: 30)),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                widget.set += 1;
                              });
                            },
                            child: const Text(
                              '+',
                              style: TextStyle(fontSize: 30),
                            )),
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(bottom: 90)),
              ],
            ), //한세트

            Row(
              //Rest - 10초 +     Row (text container(row(button text button)))
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Rest",
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                const Padding(padding: EdgeInsets.only(right: 30)),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(width: 1, color: const Color(0x005c59ff)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                widget.rest -= 1;
                              });
                            },
                            child: const Text(
                              '-',
                              style: TextStyle(fontSize: 30),
                            )),
                        const Padding(padding: EdgeInsets.only(right: 30)),
                        Text("${widget.rest} 초",
                            style: const TextStyle(fontSize: 30)),
                        const Padding(padding: EdgeInsets.only(right: 30)),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                widget.rest += 1;
                              });
                            },
                            child: const Text(
                              '+',
                              style: TextStyle(fontSize: 30),
                            )),
                      ],
                    )),
                const Padding(padding: EdgeInsets.only(bottom: 90)),
              ],
            ), //한세트
            Container(
              width: 400,
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                ),
                child: const Text("운동시작", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CameraApp(widget.value)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
