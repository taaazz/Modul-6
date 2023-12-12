import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modul6/app/data/api/fetch_post.dart';

// Import file yang akan diuji
import 'package:modul6/app/data/model/posts.dart';

import 'api_service_test.mocks.dart';

// Mock implementation of http.Client
@GenerateMocks([http.Client])
void main() {
  group('fetchPosts', () {
    test('returns a Posts object if the HTTP call completes successfully',
        () async {
      // Create a mock client
      final mockClient = MockClient();

      // Set up the mock response when the client fetches data
      when(mockClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')))
          .thenAnswer((_) async => http.Response('''
            {
              "userId": 1,
              "id": 1,
              "title": "Sample Title",
              "body": "Sample Body"
            }
          ''', 200));

      // Call the function to test
      final result = await fetchPosts(mockClient);

      // Expectation: Check if the result is a Posts object
      expect(result, isA<Posts>());
      // Additional expectations based on your implementation
      expect(result.userId, 1);
      expect(result.id, 1);
      expect(result.title, 'Sample Title');
      expect(result.body, 'Sample Body');
    });

    test('throws an exception if the HTTP call completes with an error',
        () async {
      // Create a mock client
      final mockClient = MockClient();

      // Set up the mock response for an error scenario
      when(mockClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // Call the function to test and expect an exception
      expect(fetchPosts(mockClient), throwsException);
    });
  });
}
