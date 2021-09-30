import 'dart:convert';

import 'package:http/http.dart' as http;

enum MediaType { image, video, text }

class Highlight {
  final String image;
  final String headline;
  final String content;

  Highlight({this.content, this.image, this.headline});
}

class Gnews {
  final String title;
  final List<Highlight> highlights;

  Gnews({this.title, this.highlights});
}

/// The repository fetches the data from the same directory from git.
/// This is just to demonstrate fetching from a remote (workflow).
class Repository {
  static MediaType _translateType(String type) {
    if (type == "image") {
      return MediaType.image;
    }

    if (type == "video") {
      return MediaType.video;
    }

    return MediaType.text;
  }

  static Future<Gnews> getNews() async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=640f7435fec643d6abdd8eb6de375859"));

    // use utf8.decode to make emojis work
    final data = jsonDecode(response.body);
    final highlights = data["articles"].map<Highlight>((it) {
      return Highlight(headline: it["title"], image: it["urlToImage"], content: it["content"]);
    }).toList();

    return Gnews(highlights: highlights);
  }
}
