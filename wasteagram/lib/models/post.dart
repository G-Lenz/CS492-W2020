import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;
import 'package:location/location.dart';

class Post {

  File image;
  String url;
  String date;
  int wasteCount;
  double latitude;
  double longitude;

  Post({this.image, this.url, this.wasteCount, this.date, this.latitude, this.longitude});

  void postToCloud(collectionName) async {
    LocationData location = await getLocation();
    setLocation(location.latitude, location.longitude);
    String url = await postImageGetURL();
    Firestore.instance.collection(collectionName).add({
      "quantity": wasteCount,
      "date": DateTime.now(),
      "imageURL": url,
      "latitude": latitude,
      "longitude": longitude,
    });
  }

    Future<String> postImageGetURL() async {
    StorageReference storageReference = 
      FirebaseStorage.instance.ref().child(p.basename(image.path) + DateTime.now().toString());
      StorageUploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.onComplete;
      String refURL = await storageReference.getDownloadURL();
      return refURL;
  }

  Future<LocationData> getLocation() async {
    LocationData location = await Location().getLocation();
    return location;

  }

  void setLocation(latitude, longitude) {
    this.latitude = latitude;
    this.longitude = longitude;
  }

  void mapItems({image, url, date, wasteCount, latitude, longitude}) {
    if (image != null) this.image = image; 
    if (url != null) this.url = url;
    if (date != null) this.date = date;
    if (wasteCount != null) this.wasteCount = wasteCount;
    if (latitude != null) this.latitude = latitude;
    if (longitude != null) this.longitude = longitude;
  }


}