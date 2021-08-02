import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:split_it/shared/models/base_model.dart';

class FirebaseRepository {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  Future<String> create<T extends BaseModel>(T data) async {
    final response =
        await firestore.collection(data.collection).add(data.toMap());

    return response.id;
  }

  Future<List<Map<String, dynamic>>> where(
      {required String key,
      required String value,
      required String collection}) async {
    final response = await firestore
        .collection(collection)
        .where(key, isEqualTo: value)
        .get();

    return response.docs.map((e) => e.data()).toList();
  }

  update() {}

  Future<List<Map<String, dynamic>>> get(String collection) async {
    final response = await this.firestore.collection(collection).get();
    return response.docs.map((e) => e.data()).toList();
  }

  delete() {}

  firstWhere() {}
}
