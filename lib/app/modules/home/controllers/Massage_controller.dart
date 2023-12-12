import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_application_1/app/modules/home/controllers/constan.dart';

class DatabaseAPI {
  Client client = Client();
  late final Account account;
  late final Databases databases;

  DatabaseAPI() {
    init();
  }

  init() {
    client.setEndpoint(APPWRITE_URL).setProject(APPWRITE_Pid).setSelfSigned();
    account = Account(client);
    databases = Databases(client);
  }

  Future<DocumentList> getMessages() {
    return databases.listDocuments(
      databaseId: APPWRITE_DBid,
      collectionId: APPWRITE_COLECTION_FAQ,
    );
  }

  Future<Document> addMessage({required String message}) {
    return databases.createDocument(
        databaseId: APPWRITE_DBid,
        collectionId: APPWRITE_COLECTION_FAQ,
        documentId: ID.unique(),
        data: {
          'text': message,
          'date': DateTime.now().toString(),
        });
  }

  Future<Document> updateMessage(
      {required String id, required String updatedMessage}) {
    return databases.updateDocument(
      databaseId: APPWRITE_DBid,
      collectionId: APPWRITE_COLECTION_FAQ,
      documentId: id,
      data: {
        'text': updatedMessage,
        'date': DateTime.now().toString(),
      },
    );
  }

  Future<dynamic> deleteMessage({required String id}) {
    return databases.deleteDocument(
        databaseId: APPWRITE_DBid,
        collectionId: APPWRITE_COLECTION_FAQ,
        documentId: id);
  }
}
