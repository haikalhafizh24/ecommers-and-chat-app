import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:storma/models/message_model.dart';
import 'package:storma/models/product_model.dart';
import 'package:storma/models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessageByUserId({required int userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          // ignore: avoid_print
          print(message.data());
          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();
        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt.compareTo(b.createdAt),
        );
        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage({
    required UserModel user,
    required bool isFromUser,
    required String message,
    required ProductModel product,
  }) async {
    try {
      firestore.collection('messages').add({
        'userId': user.id,
        'username': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': message,
        'product': product is UninitializeProductModel ? {} : product.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
        // ignore: avoid_print
      }).then(
        // ignore: avoid_print
        (value) => print('pesan berhasil dikirim'),
      );
    } catch (e) {
      throw Exception('Pesan gagal dikirim');
    }
  }
}
