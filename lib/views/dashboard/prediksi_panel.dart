import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hama Caisim Prediction',
      theme: ThemeData(),
      home: const Test1(),
    );
  }
}

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test1> {
  File? _file;
  String? prediction = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hama Caisim Prediction'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _file == null
                    ? const Text("Image not found")
                    : Image.file(
                        _file!,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                const SizedBox(height: 16),
                Text(
                  prediction ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 16),
                _buildButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      children: <Widget>[
        ElevatedButton.icon(
          onPressed: () => uploadImage(),
          icon: const Icon(FontAwesomeIcons.upload),
          label: const Text("Upload Image"),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () async {
            await predict();
            print("Prediction Result: $prediction");
          },
          icon: const Icon(FontAwesomeIcons.wandMagic),
          label: const Text("Predict"),
        ),
      ],
    );
  }

  Future<void> uploadImage() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (myfile == null) return;

    setState(() {
      _file = File(myfile.path);
      prediction = "";
    });
  }

  Future<void> predict() async {
    if (_file == null) return;

    var uri = Uri.parse("http://192.168.176.85:5000/submit");

    var request = http.MultipartRequest("POST", uri);
    var multipartFile = http.MultipartFile(
      'file',
      http.ByteStream(Stream.castFrom(_file!.openRead())),
      _file!.lengthSync(),
      filename: _file!.path.split("/").last,
      contentType: MediaType('image', 'jpeg'),
    );

    request.files.add(multipartFile);

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        setState(() {
          prediction = responseBody;
        });
      } else {
        print("Image upload failed.");
      }
    } catch (e) {
      print("Error uploading image: $e");
    }
  }
}
