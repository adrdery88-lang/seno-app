import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class RoleplayChatScreen extends StatefulWidget {
  final String personaId;
  const RoleplayChatScreen({super.key, required this.personaId});

  @override
  State<RoleplayChatScreen> createState() => _RoleplayChatScreenState();
}

class _RoleplayChatScreenState extends State<RoleplayChatScreen> {
  final List<Map<String, String>> _messages = [
    {
      'sender': 'ai',
      'text': 'Good morning. Welcome to the interview. Could you please introduce yourself and your background?',
    },
    {
      'sender': 'user',
      'text': 'Hello Sarah. I have been working as a mobile developer for three years, specializing in cross-platform systems.',
      'score': '92%',
    },
    {
      'sender': 'ai',
      'text': 'Impressive. Can you describe a challenging technical trade-off you had to navigate in your last project?',
    },
  ];

  final _textController = TextEditingController();
  bool _isSpeaking = false;

  void _send() {
    if (_textController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({'sender': 'user', 'text': _textController.text.trim(), 'score': '89%'});
        _textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        title: const Text('AI Voice Roleplay'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('End & Report', style: TextStyle(color: AppColors.secondary, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: _messages.length,
                itemBuilder: (context, i) {
                  final msg = _messages[i];
                  final isUser = msg['sender'] == 'user';
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(14),
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.78),
                      decoration: BoxDecoration(
                        color: isUser ? AppColors.primary : AppColors.darkSurface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: isUser ? AppColors.primaryLight : AppColors.darkBorder),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(msg['text']!, style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.3)),
                          if (isUser && msg['score'] != null) ...[
                            const SizedBox(height: 6),
                            Text('Pronunciation: ${msg['score']}', style: const TextStyle(color: AppColors.secondary, fontSize: 11, fontWeight: FontWeight.bold)),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.darkSurface,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(_isSpeaking ? Icons.stop_circle_rounded : Icons.mic_rounded,
                        color: _isSpeaking ? AppColors.accent : AppColors.primaryLight, size: 30),
                    onPressed: () => setState(() => _isSpeaking = !_isSpeaking),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Speak or type your response...',
                        hintStyle: const TextStyle(color: AppColors.darkTextSecondary),
                        filled: true,
                        fillColor: AppColors.darkBackground,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send_rounded, color: AppColors.primary),
                    onPressed: _send,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
