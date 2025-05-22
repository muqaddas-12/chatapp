
import 'package:chatapp/src/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream to get all users
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // Return the user data as a map
        return doc.data() as Map<String, dynamic>;
      }).toList();
    });
  }

  // Send a message to the chat room
  Future<void> sendMessage(String receiverID, String message) async {
    // Get current user info
    final currentUser = _auth.currentUser;
    if (currentUser == null) return;

    final String currentUserID = currentUser.uid;
    final String currentUserEmail =
        currentUser.email ?? 'anonymous'; // Fallback if email is null
    final Timestamp timestamp = Timestamp.now();

    // Create a new message
    Message newMessage = Message(
      senderID: currentUserID, // Corrected to use UID as senderID
      senderEmail: currentUserEmail, // Email as senderEmail
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );

    // Construct chat room ID
    List<String> ids = [currentUserID, receiverID];
    ids.sort(); // Sort to ensure consistent chat room ID
    String chatRoomId = ids.join("_");

    // Add message to Firestore
    await _firestore
        .collection("ChatRooms")
        .doc(chatRoomId)
        .collection("Messages")
        .add(newMessage.toMap());
  }

  // Stream to get messages for a specific chat room
  Stream<QuerySnapshot> getMessages(String senderID, String receiverID) {
    List<String> ids = [senderID, receiverID];
    ids.sort(); // Sort to ensure consistent chat room ID
    String chatRoomId = ids.join("_");

    return _firestore
        .collection("ChatRooms")
        .doc(chatRoomId)
        .collection("Messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
