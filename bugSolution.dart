```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      // Check if jsonResponse is a list before accessing elements
      if (jsonResponse is List) {
        if (jsonResponse.isNotEmpty) {
          final firstItem = jsonResponse[0];
          print(firstItem);
        } else {
          print('JSON response is an empty list.');
        }
      } else {
        print('JSON response is not a list.  Type: ${jsonResponse.runtimeType}');
        // Consider logging the full jsonResponse for debugging
      }
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  } on FormatException catch (e) {
    print('Error decoding JSON: $e');
  } on http.ClientException catch (e) {
    print('Network error: $e');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}
```