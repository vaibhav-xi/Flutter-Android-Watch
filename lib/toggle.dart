
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Togglelight extends StatefulWidget {
  const Togglelight({super.key});

  @override
  TogglelightState createState() => TogglelightState();
}

class TogglelightState extends State<Togglelight> {
  final TextEditingController _ipController = TextEditingController();
  final green2 = const Color.fromRGBO(48, 90, 62, 1);

  @override
  void initState() {
    super.initState();

    _ipController.text = "192.168.1.7";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Room Light',
          style: GoogleFonts.poppins(
            color: Colors.black,
          ),
        ),
      ),
      body: Stack (
        children: [
          SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _ipController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'IP Address ',
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 10),
            Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: green2),
              child: InkWell(
                onTap: () {
                  _toggleio(_ipController.text);
                },
                child: Center(
                    child: Text(
                  'Toggle',
                  style: GoogleFonts.poppins(color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}

_toggleio(String nodeip) async {
  try {
    // Define the URL of your NodeMCU web server
    var url = Uri.parse('http://$nodeip/toggle'); // Replace with your NodeMCU IP address

    // Send a POST request to toggle the LED
    var response = await http.post(url);

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('LED toggled successfully');
    } else {
      print('Failed to toggle LED: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
