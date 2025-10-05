import 'package:flutter/cupertino.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;

enum ToastType {
  defaultType,
  description,
  success,
  info,
  warning,
  error,
  action,
  promise,
}

OverlayEntry? _currentToastEntry;

void showToast(
  BuildContext context,
  String message, {
  ToastType type = ToastType.defaultType,
  Duration duration = const Duration(seconds: 2),
  VoidCallback? onAction,
  String? actionLabel,
}) {
  _currentToastEntry?.remove();
  _currentToastEntry = null;

  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => _CupertinoToastOverlay(
      message: message,
      type: type,
      onAction: onAction,
      actionLabel: actionLabel,
    ),
  );

  _currentToastEntry = overlayEntry;

  overlay.insert(overlayEntry);

  Future.delayed(duration, () {
    if (_currentToastEntry == overlayEntry) {
      overlayEntry.remove();
      _currentToastEntry = null;
    }
  });
}

class _CupertinoToastOverlay extends StatefulWidget {
  final String message;
  final ToastType type;
  final VoidCallback? onAction;
  final String? actionLabel;

  const _CupertinoToastOverlay({
    required this.message,
    required this.type,
    this.onAction,
    this.actionLabel,
  });

  @override
  State<_CupertinoToastOverlay> createState() => _CupertinoToastOverlayState();
}

class _CupertinoToastOverlayState extends State<_CupertinoToastOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    Future.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  IconData? _getIcon() {
    switch (widget.type) {
      case ToastType.success:
        return lucide.LucideIcons.checkCircle;
      case ToastType.info:
        return lucide.LucideIcons.info;
      case ToastType.warning:
        return lucide.LucideIcons.alertCircle;
      case ToastType.error:
        return lucide.LucideIcons.xCircle;
      case ToastType.promise:
        return null;
      default:
        return null;
    }
  }

  Color _getIconColor() {
    switch (widget.type) {
      case ToastType.success:
        return const Color(0xFF10B981);
      case ToastType.info:
        return const Color(0xFF3B82F6);
      case ToastType.warning:
        return const Color(0xFFF59E0B);
      case ToastType.error:
        return const Color(0xFFEF4444);
      default:
        return CupertinoColors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final icon = _getIcon();
    final hasAction =
        widget.type == ToastType.action && widget.onAction != null;

    return Positioned(
      top: 60,
      left: 0,
      right: 0,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.black.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.black.withValues(alpha: 0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.type == ToastType.promise) ...[
                      const SizedBox(
                        width: 16,
                        height: 16,
                        child: CupertinoActivityIndicator(
                          radius: 8,
                          color: CupertinoColors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ] else if (icon != null) ...[
                      Icon(icon, size: 18, color: _getIconColor()),
                      const SizedBox(width: 10),
                    ],

                    Flexible(
                      child: Text(
                        widget.message,
                        style: const TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    if (hasAction) ...[
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: widget.onAction,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: CupertinoColors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            widget.actionLabel ?? 'Action',
                            style: const TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
