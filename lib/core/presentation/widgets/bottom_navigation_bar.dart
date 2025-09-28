import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import '../../constants/app_colors.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Widget _buildTabItem({
    required IconData icon,
    required int index,
    required bool isActive,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 24,
                color: isActive
                    ? AppColors.primary
                    : CupertinoColors.systemGrey,
                fill: isActive ? 1.0 : 0.0,
              ),
              const SizedBox(height: 8),
              Container(
                height: 2,
                width: 40,
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.primary
                      : CupertinoColors.transparent,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.background,
            border: Border(
              top: BorderSide(color: CupertinoColors.separator, width: 0.5),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Row(
              children: [
                _buildTabItem(
                  icon: lucide.LucideIcons.home,
                  index: 0,
                  isActive: currentIndex == 0,
                ),
                _buildTabItem(
                  icon: lucide.LucideIcons.messageCircle,
                  index: 2,
                  isActive: currentIndex == 2,
                ),
                const Expanded(child: SizedBox()),
                _buildTabItem(
                  icon: lucide.LucideIcons.heart,
                  index: 3,
                  isActive: currentIndex == 3,
                ),
                _buildTabItem(
                  icon: lucide.LucideIcons.userCircle,
                  index: 4,
                  isActive: currentIndex == 4,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -26,
          left: 0,
          right: 0,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => onTap(1),
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: currentIndex == 1
                          ? AppColors.primary.withValues(alpha: 0.9)
                          : AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: CupertinoColors.black.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      lucide.LucideIcons.qrCode,
                      color: CupertinoColors.white,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: 48,
                  height: 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.22),
                        blurRadius: 32,
                        spreadRadius: 4,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 14),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primary.withValues(alpha: 0.35),
                              AppColors.primary.withValues(alpha: 0.18),
                              AppColors.primary.withValues(alpha: 0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
