import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_service.dart';
import 'package:go_router/go_router.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nicknameController = TextEditingController();
  final UserService userService = UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nicknameController,
              decoration: const InputDecoration(labelText: 'Nickname'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final nickname = nicknameController.text.trim();
                debugPrint(nickname);

                final uid = FirebaseAuth.instance.currentUser!.uid;

                await userService.createUser(uid : uid, nickname : nickname);
                context.go('/home');


  },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  } 
}