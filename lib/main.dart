import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LeadResponse? leadResponse;

  Future<LeadResponse?> fetchLeads() async {
    const String apiUrl = "https://api.thenotary.app/lead/getLeads";

    // Define the request body as a map
    final Map<String, String> requestBody = {
      "notaryId": "643074200605c500112e0902"
    };

    // Encode the request body to JSON
    final String encodedBody = json.encode(requestBody);

    // Set the headers for the request
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    // Send the POST request
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: encodedBody,
    );

    if (response.statusCode == 200) {
      // Request was successful
      final decodedData = json.decode(response.body);

      if (decodedData is Map<String, dynamic>) {
        return LeadResponse.fromJson(decodedData);
      } else {
        print("Invalid response format");
        return null;
      }
    } else {
      // Request failed
      print("Request failed with status code: ${response.statusCode}");
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Assignment"),
      ),
      body: FutureBuilder(
        future: fetchLeads(),
        builder: (BuildContext context, AsyncSnapshot<LeadResponse?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            fetchLeads().then((response) {
                leadResponse = response;
            });
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError) {
              debugPrint(snapshot.error.toString());
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${snapshot.error}, \nPlease check your internet connection!",textAlign: TextAlign.center,),
                    ElevatedButton(onPressed: (){
                      setState(() {

                    });}, child: const Text("Reload"))
                  ],
                ),
              );
            } else {
              if (leadResponse == null) {
                return const Center(
                  child: Text("No data available."),
                );
              }
              return ListView.builder(
                itemCount: leadResponse!.leads.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(lead: leadResponse!.leads[index],)));
                    },
                    child: Column(
                      children: [
                        ListTile(
                          leading: leadResponse!.leads[index].imageURL.isNotEmpty ? const CircleAvatar(radius:25,child: Icon(Icons.person,size: 40,),):const CircleAvatar(child: Icon(Icons.person_add_alt_1),),
                          title: Text("${leadResponse!.leads[index].firstName}  ${leadResponse!.leads[index].lastName ?? "N/A"}"),
                          subtitle: Text(leadResponse!.leads[index].email),
                        ),
                        const Divider(thickness: 2,)
                      ],
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
