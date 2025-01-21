```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonResponse = jsonDecode(response.body);
      // Here's where the bug might occur.  If jsonResponse is not a list, calling [0] will throw an error
      final firstItem = jsonResponse[0]; // This line could cause an exception 
      print(firstItem);
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
    // Instead of rethrowing the exception, consider handling various error cases (e.g., network, JSON parsing)
  }
}
```