import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class WordRushScreen extends StatefulWidget {
  const WordRushScreen({super.key});

  @override
  State<WordRushScreen> createState() => _WordRushScreenState();
}

class _WordRushScreenState extends State<WordRushScreen> {
  int _score = 0;
  String? _selectedWord;
  String? _selectedDef;

  final Map<String, String> _pairs = {
    'diligent': 'مجتهد ومثابر',
    'reluctant': 'متردد',
    'inevitable': 'لا مفر منه',
    'lucid': 'واضح ومفهوم',
  };

  void _checkMatch() {
    if (_selectedWord != null && _selectedDef != null) {
      if (_pairs[_selectedWord] == _selectedDef) {
        setState(() {
          _score += 10;
          _selectedWord = null;
          _selectedDef = null;
        });
      } else {
        setState(() {
          _selectedWord = null;
          _selectedDef = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        title: const Text('Word Rush (Speed Match)'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text('Score: $_score', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.xpGold)),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const LinearProgressIndicator(value: 0.65, color: AppColors.warning, backgroundColor: AppColors.darkBorder),
              const SizedBox(height: 24),
              Expanded(
                child: Row(
                  children: [
                    // Words Column
                    Expanded(
                      child: Column(
                        children: _pairs.keys.map((w) {
                          final isSel = _selectedWord == w;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: InkWell(
                              onTap: () {
                                setState(() => _selectedWord = w);
                                _checkMatch();
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: isSel ? AppColors.primary : AppColors.darkSurface,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: AppColors.primary),
                                ),
                                child: Text(w, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Definitions Column
                    Expanded(
                      child: Column(
                        children: _pairs.values.map((d) {
                          final isSel = _selectedDef == d;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: InkWell(
                              onTap: () {
                                setState(() => _selectedDef = d);
                                _checkMatch();
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: isSel ? AppColors.secondary : AppColors.darkSurface,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: AppColors.secondary),
                                ),
                                child: Text(d, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
