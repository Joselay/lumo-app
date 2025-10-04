import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../../core/services/auth_service.dart';
import '../../../auth/data/repositories/auth_repository.dart';
import '../../../auth/domain/usecases/logout_usecase.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isLoggedIn = false;
  Map<String, dynamic>? _userInfo;
  bool _isLoading = true;
  late final LogoutUseCase _logoutUseCase;

  @override
  void initState() {
    super.initState();
    _logoutUseCase = LogoutUseCase(AuthRepository());
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final isLoggedIn = await AuthService.isLoggedIn();
    final userInfo = await AuthService.getUserInfo();

    setState(() {
      _isLoggedIn = isLoggedIn;
      _userInfo = userInfo;
      _isLoading = false;
    });
  }

  Future<void> _handleLogout() async {
    final confirmed = await showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('Logout'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      if (mounted) {
        showCupertinoDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              const Center(child: CupertinoActivityIndicator()),
        );
      }

      try {
        await _logoutUseCase();

        if (mounted) Navigator.of(context).pop();

        setState(() {
          _isLoggedIn = false;
          _userInfo = null;
        });
      } catch (e) {
        if (mounted) Navigator.of(context).pop();

        if (mounted) {
          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: const Text('Logout Error'),
              content: const Text(
                'Failed to logout properly. Your session has been cleared locally.',
              ),
              actions: [
                CupertinoDialogAction(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }

        setState(() {
          _isLoggedIn = false;
          _userInfo = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (_isLoading) {
      return const CupertinoPageScaffold(
        child: Center(child: CupertinoActivityIndicator()),
      );
    }

    if (!_isLoggedIn) {
      return CupertinoPageScaffold(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                      const Color(0xFF1A1A1A),
                      const Color(0xFF1C1818),
                      const Color(0xFF1A1515),
                    ]
                  : [
                      const Color(0xFFFAFAFA),
                      const Color(0xFFFDF8F8),
                      const Color(0xFFFFF5F5),
                    ],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Icon(
                        lucide.LucideIcons.userCircle,
                        size: 64,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Sign in Required',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.foreground,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Create an account or sign in to access your profile, favorites, and booking history.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: theme.colorScheme.mutedForeground,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ShadButton(
                      onPressed: () => context.go('/login'),
                      size: ShadButtonSize.lg,
                      width: double.infinity,
                      child: const Text('Sign In'),
                    ),
                    const SizedBox(height: 16),
                    ShadButton.outline(
                      onPressed: () => context.go('/register'),
                      size: ShadButtonSize.lg,
                      width: double.infinity,
                      child: const Text('Create Account'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: CupertinoColors.systemBackground.resolveFrom(
              context,
            ),
            largeTitle: const Text('Profile'),
            border: null,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.background,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: theme.colorScheme.border),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(
                            lucide.LucideIcons.user,
                            size: 40,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _userInfo?['email'] ?? 'User',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.foreground,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Cinema Member',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildMenuSection(
                    context: context,
                    theme: theme,
                    title: 'Account',
                    items: [
                      _MenuItem(
                        icon: lucide.LucideIcons.user,
                        title: 'Edit Profile',
                        subtitle: 'Update your personal information',
                        onTap: () {
                          // TODO: Navigate to edit profile
                        },
                      ),
                      _MenuItem(
                        icon: lucide.LucideIcons.bell,
                        title: 'Notifications',
                        subtitle: 'Manage notification preferences',
                        onTap: () {
                          // TODO: Navigate to notifications
                        },
                      ),
                      _MenuItem(
                        icon: lucide.LucideIcons.creditCard,
                        title: 'Payment Methods',
                        subtitle: 'Manage your payment options',
                        onTap: () {
                          // TODO: Navigate to payment methods
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  _buildMenuSection(
                    context: context,
                    theme: theme,
                    title: 'Preferences',
                    items: [
                      _MenuItem(
                        icon: lucide.LucideIcons.globe,
                        title: 'Language',
                        subtitle: 'English',
                        onTap: () {
                          // TODO: Language selector
                        },
                      ),
                      _MenuItem(
                        icon: lucide.LucideIcons.moon,
                        title: 'Theme',
                        subtitle: 'System default',
                        onTap: () {
                          // TODO: Theme selector
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  _buildMenuSection(
                    context: context,
                    theme: theme,
                    title: 'Support',
                    items: [
                      _MenuItem(
                        icon: lucide.LucideIcons.helpCircle,
                        title: 'Help & Support',
                        subtitle: 'Get help with your account',
                        onTap: () {
                          // TODO: Navigate to help
                        },
                      ),
                      _MenuItem(
                        icon: lucide.LucideIcons.fileText,
                        title: 'Terms & Privacy',
                        subtitle: 'Read our policies',
                        onTap: () {
                          // TODO: Navigate to terms
                        },
                      ),
                      _MenuItem(
                        icon: lucide.LucideIcons.info,
                        title: 'About',
                        subtitle: 'Lumo Cinema v1.0.0',
                        onTap: () {
                          // TODO: Navigate to about
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  ShadButton.destructive(
                    onPressed: _handleLogout,
                    size: ShadButtonSize.lg,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(lucide.LucideIcons.logOut, size: 20),
                        const SizedBox(width: 8),
                        const Text('Logout'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection({
    required BuildContext context,
    required ShadThemeData theme,
    required String title,
    required List<_MenuItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.mutedForeground,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.background,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.border),
          ),
          child: Column(
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isLast = index == items.length - 1;

              return Column(
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.all(16),
                    onPressed: item.onTap,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            item.icon,
                            size: 20,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.foreground,
                                ),
                              ),
                              if (item.subtitle != null) ...[
                                const SizedBox(height: 2),
                                Text(
                                  item.subtitle!,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: theme.colorScheme.mutedForeground,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        Icon(
                          lucide.LucideIcons.chevronRight,
                          size: 20,
                          color: theme.colorScheme.mutedForeground,
                        ),
                      ],
                    ),
                  ),
                  if (!isLast)
                    Padding(
                      padding: const EdgeInsets.only(left: 72),
                      child: Container(
                        height: 1,
                        color: theme.colorScheme.border,
                      ),
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });
}
