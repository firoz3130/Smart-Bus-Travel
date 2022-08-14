import 'package:flutter/material.dart';
import 'package:loginmyapp/realqr.dart';

class Payments extends StatelessWidget {
  String value, fromplaces, toplaces, number, tickets;
  Payments(
      {required this.value,
      required this.fromplaces,
      required this.toplaces,
      required this.number,
      required this.tickets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
          title: Text("Payment Gateway"),
        ),
        body: Paymentgateway(
            value: value,
            fromplaces: fromplaces,
            toplaces: toplaces,
            number: number,
            tickets: tickets));
  }
}

class Paymentgateway extends StatelessWidget {
  String value, fromplaces, toplaces, number, tickets;
  Paymentgateway(
      {required this.value,
      required this.fromplaces,
      required this.toplaces,
      required this.number,
      required this.tickets});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Dear\t", //to respond to the user to pay the respective amount
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
              Text(
                value,
                style: const TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                "\n\tYOUR TRAVEL AND PAYMENT DETAILS ARE GIVEN BELOW",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.blue),
              ),
              const SizedBox(height: 20),
              const Text(
                "FROM\t\t\t",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                fromplaces,
                style: const TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              const Text(
                "\n\nTO\t\t\t",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                toplaces,
                style: const TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Realqr(
                                      value: value,
                                      fromplaces: fromplaces,
                                      toplaces: toplaces,
                                      number: number,
                                      tickets: tickets,
                                      //passes name to print on the real qr page
                                    )));
                      },
                      child: const Text(
                        "PAY RS 25/-", //base price
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          shadowColor: Colors.yellow),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "\t\t*YOU WILL BE GETTING YOUR QRCODE ONCE YOUR PAYMENT IS DONE",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
