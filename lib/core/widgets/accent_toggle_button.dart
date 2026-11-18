import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AccentToggleButton extends StatelessWidget {
  final String currentAccent; // 'US' or 'UK'
  final ValueChanged<String> onAccentChanged;

  const AccentToggleButton({
    super.key,
    required this.currentAccent,
    required this.onAccentChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.darkBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildItem('US', '🇺🇸 US'),
          _buildItem('UK', '🇬🇧 UK'),
        ],
      ),
    );
  }

  Widget _buildItem(String accent, String label) {
    final isSelected = currentAccent == accent;
    return GestureDetector(
      onTap: () => onAccentChanged(accent),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppColors.darkTextSecondary,
          ),
        ),
      ),
    );
  }
}
