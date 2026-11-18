import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class CameraScanScreen extends StatefulWidget {
  const CameraScanScreen({super.key});

  @override
  State<CameraScanScreen> createState() => _CameraScanScreenState();
}

class _CameraScanScreenState extends State<CameraScanScreen> {
  bool _detected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('AR Snap & Learn'),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                border: Border.all(color: _detected ? AppColors.secondary : AppColors.primary, width: 3),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  _detected ? 'Object: "Laptop"\n/ˈlæp.tɑːp/' : 'Point camera at an object',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _detected ? AppColors.secondary : Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Column(
              children: [
                if (_detected)
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: AppColors.darkSurface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Laptop · حاسوب محمول', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        Icon(Icons.volume_up_rounded, color: AppColors.primary),
                      ],
                    ),
                  ),
                ElevatedButton.icon(
                  onPressed: () => setState(() => _detected = !_detected),
                  icon: const Icon(Icons.camera_alt_rounded),
                  label: Text(_detected ? 'Scan Another' : 'Capture & Identify'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 54),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
