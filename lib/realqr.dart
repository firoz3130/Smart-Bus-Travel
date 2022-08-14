import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loginmyapp/const.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Realqr extends StatefulWidget {
  String value, toplaces, fromplaces, number, tickets;
  Realqr(
      {required this.value,
      required this.fromplaces,
      required this.toplaces,
      required this.number,
      required this.tickets});
  @override
  _RealqrState createState() => _RealqrState(
      value: value,
      fromplaces: fromplaces,
      toplaces: toplaces,
      number: number,
      tickets: tickets);
}

class _RealqrState extends State<Realqr> {
  String value, toplaces, fromplaces, number, tickets;
  _RealqrState(
      {required this.value,
      required this.fromplaces,
      required this.toplaces,
      required this.number,
      required this.tickets});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("YOUR QRCODE"),
        ),
        body: Qrcodegenerator(
            value: value,
            fromplaces: fromplaces,
            toplaces: toplaces,
            number: number,
            tickets: tickets),
      ),
    );
  }
}

class Qrcodegenerator extends StatefulWidget {
  String value, toplaces, fromplaces, number, tickets;
  Qrcodegenerator(
      {required this.value,
      required this.fromplaces,
      required this.toplaces,
      required this.number,
      required this.tickets});
  @override
  _QrcodegeneratorState createState() => _QrcodegeneratorState(
      value: value,
      toplaces: toplaces,
      fromplaces: fromplaces,
      number: number,
      tickets: tickets);
}

class _QrcodegeneratorState extends State<Qrcodegenerator> {
  String value, toplaces, fromplaces, number, tickets;
  _QrcodegeneratorState(
      {required this.value,
      required this.fromplaces,
      required this.toplaces,
      required this.number,
      required this.tickets});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: [
          Center(
            child: QrImage(
              foregroundColor: Colors.amber,
              embeddedImage: const NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZs8lBsk2k-KfgnP9o0xDqy55yad92cjcbMA&usqp=CAU"),
              data: "Name:\t" +
                  value +
                  nl +
                  from +
                  tl +
                  tl +
                  fromplaces +
                  tl +
                  tl +
                  tl +
                  to +
                  tl +
                  tl +
                  tl +
                  toplaces +
                  nl +
                  phno +
                  tl +
                  number +
                  nl +
                  numberOftTickets +
                  tl +
                  tickets +
                  nl +
                  nl +
                  star +
                  nl +
                  "✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔\n" +
                  paymentStatus +
                  nl +
                  "✔✔✔✔✔✔✔✔✔✔✔✔✔✔✔\n" +
                  star +
                  nl +
                  nl +
                  "YOU CAN ENTER THE BUS!!🎁😎\nEnjoy the journey😉",
              version: QrVersions.auto,
              size: 500.0,
            ),
          ),
          Row(
            children: [
              const Text(
                "\t\tDear ",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(value,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              const Text(
                " ,",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ],
          ),
          const Text(
            "\t\t\t\t\t\t\t\t\t\t\t\tYOUR QRCODE IS READY\nSCAN THIS QR FOR ENTRY AND EXIT",
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          )
        ],
      ),
    );
  }
}
