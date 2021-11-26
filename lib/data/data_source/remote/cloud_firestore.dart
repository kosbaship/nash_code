// TODO create Cloud firestore service class
// TODO create function inside this class to SAVE user data into firebase firestore
// TODO create function inside this class to GET user data from firebase firestore
class CloudFirestoreService {
  Future<String> getDataFromServer() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Nash';
  }
}
