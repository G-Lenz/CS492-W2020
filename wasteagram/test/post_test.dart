import '../lib/models/post.dart';
import 'package:flutter_test/flutter_test.dart';




void main() {

  test('Creating post from map', () {
    Post post = Post();
    post.mapItems(url: "example", latitude: 1.0, longitude: 1.0, wasteCount: 2);

    expect(post.url, "example");
    expect(post.latitude, 1.0);
    expect(post.longitude, 1.0);
    expect(post.image, isNull);
  });

  test('Setting location data', () async {
    Post post = Post();
    double latitude = 1.0;
    double longitude = 2.0;

    post.setLocation(latitude, longitude);
    expect(post.latitude, latitude);
    expect(post.longitude, longitude);
  });

  test('Creating a Post with parameters', () {
    Post post = Post(url: "something" , wasteCount: 12);

    expect(post.url, "something");
    expect(post.wasteCount, 12);
    expect(post.longitude, isNull);
  });
}
