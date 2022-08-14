import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginmyapp/destination.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(StartPage());
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loginpage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Destination();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

//login implementation
class _LoginpageState extends State<Loginpage> {
  //Login function
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordCon = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.cyan,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        ),
        title: const Text("BMTC TICKET COLLECTOR"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage('lib/assets/bmtcbusfront.jpeg')),
              const SizedBox(
                height: 10,
              ),
              Text(
                "LOGIN TO YOUR ACCOUNT",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "E-mail address",
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    )),
              ),
              TextField(
                controller: _passwordCon,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "password",
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Don't Remember your password?",
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                    fillColor: Color(0xFF0069FE),
                    elevation: 0.0,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () async {
                      User? user = await loginUsingEmailPassword(
                          email: _emailController.text,
                          password: _passwordCon.text,
                          context: context);
                      print(user);
                      if (user != null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Destination()));
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
