Future<String> extractQuotes(String html) async{
  final RegExp quotePattern = RegExp(r'<li>(.*?)<ul>', dotAll: true);
  final Iterable<Match> matches = quotePattern.allMatches(html);

  List<String> quotes =
      matches.map((match) {
        String quote = match.group(1)!;
        // Remove HTML tags
        quote = quote.replaceAll(RegExp(r'<[^>]+>'), '');
        // Trim and clean up whitespace
        return quote.trim();
      }).toList();

  return quotes.join('\n\n');
}
