import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/utils/date_utils.dart';

class WordVaultScreen extends StatelessWidget {
  const WordVaultScreen({super.key});

  final List<Map<String, dynamic>> _savedWords = const [
    {
      'id': 'w1',
      'word': 'negotiation',
      'ipa': '/nɪˌɡoʊ.ʃiˈeɪ.ʃən/',
      'trans': 'مفاوضات',
      'due': true,
      'interval': 'Due Today',
    },
    {
      'id': 'w2',
      'word': 'lucid',
      'ipa': '/ˈluː.sɪd/',
      'trans': 'واضح ومفهوم',
      'due': true,
      'interval': 'Due Today',
    },
    {
      'id': 'w3',
      'word': 'bite the bullet',
      'ipa': '/baɪt ðə ˈbʊl.ɪt/',
      'trans': 'يتشجع لمواجهة الصعاب',
      'due': false,
      'interval': 'In 3 days',
    },
    {
      'id': 'w4',
      'word': 'pragmatic',
      'ipa': '/præɡˈmæt.ɪk/',
      'trans': 'عملي وواقعي',
      'due': false,
      'interval': 'In 6 days',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        title: const Text('Word Vault'),
        actions: [
          IconButton(icon: const Icon(Icons.search_rounded), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // SRS Due Banner
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.warning, Colors.orangeAccent],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  const Icon(Icons.alarm_on_rounded, color: Colors.black, size: 36),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('2 Words Due for Review', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                        SizedBox(height: 2),
                        Text('SM-2 Spaced Repetition Queue', style: TextStyle(color: Colors.black87, fontSize: 12)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => context.go(RouteNames.srsReview),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Review', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: _savedWords.length,
                itemBuilder: (context, i) {
                  final word = _savedWords[i];
                  final isDue = word['due'] as bool;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.darkSurface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.darkBorder),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(word['word'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                              const SizedBox(height: 2),
                              Text(word['ipa'] as String, style: const TextStyle(fontFamily: 'NotoSans', fontSize: 13, color: AppColors.primaryLight)),
                              const SizedBox(height: 4),
                              Text(word['trans'] as String, style: const TextStyle(fontSize: 13, color: AppColors.darkTextSecondary)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: isDue ? AppColors.warning.withOpacity(0.15) : AppColors.darkBorder,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: isDue ? AppColors.warning : Colors.transparent),
                          ),
                          child: Text(
                            word['interval'] as String,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: isDue ? AppColors.warning : AppColors.darkTextSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
