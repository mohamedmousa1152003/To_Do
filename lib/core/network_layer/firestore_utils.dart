import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/task_model.dart';

class FirestoreUtils {

  static  CollectionReference<TaskModel> getCollection(){
   return FirebaseFirestore.instance
       .collection("TaskCollection")
       .withConverter<TaskModel>(
       fromFirestore: (snapshot, _) => TaskModel.formFireStore(snapshot.data()!),
       toFirestore: (value, _) => value.toFireStore(),
   );
 }

  static Future<void> addDataToFireStore(TaskModel model){
    var collectionRef = getCollection();
    var docRef =collectionRef.doc();
    model.id = docRef.id;
    return docRef.set(model);
  }

  static Future<void> deleteDataToFireStore(TaskModel model){
    var collectionRef = getCollection();
    return collectionRef.doc(model.id).delete();
  }

  static Future<List<TaskModel>>getDataToFireStore() async{
    var snapshot = await getCollection().get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  static Stream<QuerySnapshot<TaskModel>>getRealTimeDataToFireStore() {
    var snapshot =  getCollection().snapshots();
    return snapshot;
  }



}