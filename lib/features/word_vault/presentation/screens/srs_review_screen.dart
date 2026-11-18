import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/srs_algorithm.dart';

class SrsReviewScreen extends StatefulWidget {
  const SrsReviewScreen({super.key});

  @override
  State<SrsReviewScreen> createState() => _SrsReviewScreenState();
}

class _SrsReviewScreenState extends State<SrsReviewScreen> {
  bool _revealed = false;
  int _cardIndex = 0;

  final List<Map<String, String>> _cards = [
    {
      'word': 'negotiation',
      'ipa': '/nɪˌɡoʊ.ʃiˈeɪ.ʃən/',
      'def': 'Discussion aimed at reaching an agreement.',
      'trans': 'مفاوضات',
      'ex': 'Both parties entered into a constructive negotiation.',
    },
    {
      'word': 'lucid',
      'ipa': '/ˈluː.sɪd/',
      'def': 'Expressed clearly; easy to understand.',
      'trans': 'واضح ومفهوم',
      'ex': 'She gave a wonderfully lucid explanation of the theory.',
    },
  ];

  void _rate(int quality) {
    if (_cardIndex < _cards.length - 1) {
      setState(() {
        _cardIndex++;
        _revealed = false;
      });
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final card = _cards[_cardIndex];

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(title: Text('Review ${_cardIndex + 1}/${_cards.length}')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _revealed = !_revealed),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: AppColors.darkSurface,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.primary.withOpacity(0.4), width: 1.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          card['word']!,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          card['ipa']!,
                          style: const TextStyle(fontFamily: 'NotoSans', fontSize: 16, color: AppColors.primaryLight),
                        ),
                        const SizedBox(height: 32),
                        if (!_revealed)
                          const Text(
                            'Tap card to reveal meaning & example',
                            style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 14),
                          )
                        else ...[
                          Text(
                            card['trans']!,
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.secondary),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            card['def']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white70, fontSize: 15),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '"${card['ex']!}"',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: AppColors.darkTextSecondary, fontStyle: FontStyle.italic, fontSize: 14),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              if (_revealed) ...[
                const Text('Rate your recall recall (SM-2):', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 13)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _rateBtn('Again', AppColors.accent, () => _rate(1)),
                    _rateBtn('Hard', AppColors.warning, () => _rate(3)),
                    _rateBtn('Good', AppColors.info, () => _rate(4)),
                    _rateBtn('Easy', AppColors.secondary, () => _rate(5)),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _rateBtn(String title, Color color, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.2),
        foregroundColor: color,
        side: BorderSide(color: color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
