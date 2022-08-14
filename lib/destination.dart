import 'package:flutter/material.dart';
import 'package:loginmyapp/payments.dart';

class Destination extends StatefulWidget {
  const Destination({Key? key}) : super(key: key);

  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: const Deserved(),
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text("Destination Charter"),
          )),
    );
  }
}

class Deserved extends StatefulWidget {
  const Deserved({Key? key}) : super(key: key);

  @override
  _DeservedState createState() => _DeservedState();
}

class _DeservedState extends State<Deserved> {
  String dropdownvalue = 'FROM';
  final _places = [
    'Majestic',
    'Silk Board',
    'Koramangala',
    'K. R Puram',
    'T .C Palya',
    'Bellandur',
    'Marathahalli',
    'Kempegowda International Airport',
    'Tin Factory',
    'ITI gate',
    'IndiraNagar',
    'Byappanahalli',
    'Banashankari'
  ];
  late String value;
  late String fromplaces, toplaces, number, tickets;
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "ENTER DETAILS",
            style: TextStyle(
                fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            onChanged: (text) {
              value = text;
            },
            controller: _nameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              hintText: "Name",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            onChanged: (num) {
              number = num;
            },
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              hintText: "Phone Number",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 100),
            child: Text(
              "ENTER NUMBER OF TICKETS",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (tic) {
              tickets = tic;
            },
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              hintText: "Number of tickets",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: const EdgeInsets.only(right: 180),
            child: Text(
              "BOARDING   STATION",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ),
          /*DropdownButton(
            borderRadius: BorderRadius.circular(30),
            icon: Icon(Icons.place),
            items: _places.map((String items) {
              return DropdownMenuItem(value: items, child: Text(items));
            }).toList(),
            value: dropdownvalue,
            onChanged: (String? value) {},
          ),*/
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(icon: Icon(Icons.place)),
            hint: const Text('Select Boarding Station'),
            items: _places.map((e) {
              return DropdownMenuItem(value: e, child: Text(e));
            }).toList(),
            onChanged: (value) => setState(() {
              fromplaces = value!;
            }),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: const EdgeInsets.only(right: 160),
            child: Text(
              "DESTINATION STATION",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(icon: Icon(Icons.place)),
            hint: const Text('Select Destination Station'),
            items: _places.map((e) {
              return DropdownMenuItem(value: e, child: Text(e));
            }).toList(),
            onChanged: (val) => setState(() {
              toplaces = val!;
            }),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Payments(
                                value: value,
                                fromplaces: fromplaces,
                                toplaces: toplaces,
                                number: number,
                                tickets: tickets)));
                  },
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      shadowColor: Colors.yellow),
                )),
          )
        ],
      ),
    );
  }
}
