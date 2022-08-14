import 'package:flutter/material.dart';
import 'package:loginmyapp/destination.dart';

class Qrpage extends StatelessWidget {
  const Qrpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectPlace(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("TICKET ASSISTANT"),
      ),
    );
  }
}

class SelectPlace extends StatefulWidget {
  const SelectPlace({Key? key}) : super(key: key);

  @override
  _SelectPlaceState createState() => _SelectPlaceState();
}

class _SelectPlaceState extends State<SelectPlace> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          TextField(
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
          const TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.psychology),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              hintText: "Age",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
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
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Destination()));
                  },
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20), shadowColor: Colors.yellow),
                )),
          )
        ],
      ),
    );
  }
}
