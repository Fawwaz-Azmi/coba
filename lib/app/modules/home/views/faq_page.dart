import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_application_1/app/modules/home/controllers/Massage_controller.dart';

// ... (imports)

class faqPage extends StatefulWidget {
  const faqPage({Key? key}) : super(key: key);

  @override
  _faqPageState createState() => _faqPageState();
}

class _faqPageState extends State<faqPage> {
  final database = DatabaseAPI();
  late List<Document>? messages = [];
  TextEditingController messageTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // authStatus = appwrite.status;
    loadMessages();
  }

  loadMessages() async {
    try {
      final value = await database.getMessages();
      setState(() {
        messages = value.documents;
      });
    } catch (e) {
      print(e);
    }
  }

  addMessage() async {
    try {
      await database.addMessage(message: messageTextController.text);
      const snackbar = SnackBar(content: Text('Message added!'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      messageTextController.clear();
      loadMessages();
    } on AppwriteException catch (e) {
      showAlert(title: 'Error', text: e.message.toString());
    }
  }

  updateMessage(String id, String currentText) async {
    TextEditingController updatedTextController =
        TextEditingController(text: currentText);

    final updatedText = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Message'),
          content: TextField(
            controller: updatedTextController,
            decoration: const InputDecoration(labelText: 'New Message'),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(updatedTextController.text);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );

    if (updatedText != null) {
      try {
        await database.updateMessage(id: id, updatedMessage: updatedText);
        loadMessages();
      } on AppwriteException catch (e) {
        showAlert(title: 'Error', text: e.message.toString());
      }
    }
  }

  deleteMessage(String id) async {
    try {
      await database.deleteMessage(id: id);
      loadMessages();
    } on AppwriteException catch (e) {
      showAlert(title: 'Error', text: e.message.toString());
    }
  }

  showAlert({required String title, required String text}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      decoration:
                          const InputDecoration(hintText: 'Type a message'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      addMessage();
                    },
                    icon: const Icon(Icons.send),
                    label: const Text("Send"),
                  ),
                ],
              ),
              Center(),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: messages?.length ?? 0,
                  itemBuilder: (context, index) {
                    final message = messages![index];
                    return Card(
                      child: ListTile(
                        title: Text(message.data['text']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                updateMessage(
                                  message.$id,
                                  message.data['text'],
                                );
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                deleteMessage(message.$id);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
