import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:html/parser.dart' show parse;


class News extends StatefulWidget {
  const News({super.key});

  @override
  _WordPressSiteWidgetState createState() => _WordPressSiteWidgetState();
}

class _WordPressSiteWidgetState extends State<News> {
  final String siteUrl =
      'https://hoy.com.do'; // URL completa de tu sitio WordPress
  final String apiUrl = '/wp-json/wp/v2/posts';

  List<dynamic> posts = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse('$siteUrl$apiUrl'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        posts = data;
      });
    }
  }

  String stripHtml(String htmlString) {
    var document = parse(htmlString);
    return parse(document.body!.text).documentElement!.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: const Image(
                image: AssetImage('assets/images/listindiario.jpeg'),
                width: 180,
                height: 180,
              ),
            ),
            const SizedBox(height: 20),
            if (posts.isNotEmpty)
              Column(
                children: posts.take(3).map((post) {
                  return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(8),
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              post['title']['rendered'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(stripHtml(post['excerpt']['rendered'])),
                          ),
                        ],
                      ));
                }).toList(),
              ),
          ],
        ),
      ),
    ); 

  }
}
