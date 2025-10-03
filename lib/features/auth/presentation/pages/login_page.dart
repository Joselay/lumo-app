import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../data/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../viewmodels/auth_bloc.dart';
import '../viewmodels/auth_event.dart';
import '../viewmodels/auth_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        loginUseCase: LoginUseCase(AuthRepository()),
        registerUseCase: RegisterUseCase(AuthRepository()),
      ),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<ShadFormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      context.read<AuthBloc>().add(
        LoginButtonPressed(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          context.go('/home');
        } else if (state.status == AuthStatus.failure) {
          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: const Text('Login Failed'),
              content: Text(state.errorMessage ?? 'An error occurred'),
              actions: [
                CupertinoDialogAction(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final isLoading = state.status == AuthStatus.loading;

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
                child: Stack(
                  children: [
                    Positioned(
                      top: 8,
                      left: 8,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => context.go('/home'),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.background.withValues(
                              alpha: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            lucide.LucideIcons.arrowLeft,
                            color: theme.colorScheme.foreground,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 80),
                              Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      boxShadow: [
                                        BoxShadow(
                                          color: theme.colorScheme.primary
                                              .withValues(alpha: 0.4),
                                          blurRadius: 30,
                                          spreadRadius: 5,
                                        ),
                                      ],
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/logo.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  Text(
                                    'Welcome Back',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: theme.colorScheme.foreground,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Sign in to continue your cinema journey',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: theme.colorScheme.mutedForeground,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 48),
                              Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.background
                                      .withValues(alpha: 0.7),
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: theme.colorScheme.border,
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CupertinoColors.black.withValues(
                                        alpha: 0.1,
                                      ),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: ShadForm(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      _buildInputField(
                                        context: context,
                                        label: 'Email',
                                        controller: _emailController,
                                        placeholder: 'Enter your email',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Email is required';
                                          }
                                          if (!RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                          ).hasMatch(value)) {
                                            return 'Please enter a valid email';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      _buildPasswordField(
                                        context: context,
                                        label: 'Password',
                                        controller: _passwordController,
                                        placeholder: 'Enter your password',
                                        obscureText: _obscurePassword,
                                        onToggle: () {
                                          setState(() {
                                            _obscurePassword =
                                                !_obscurePassword;
                                          });
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Password is required';
                                          }
                                          if (value.length < 6) {
                                            return 'Password must be at least 6 characters';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 32),
                                      ShadButton(
                                        onPressed: isLoading
                                            ? null
                                            : _handleLogin,
                                        size: ShadButtonSize.lg,
                                        width: double.infinity,
                                        child: isLoading
                                            ? const SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CupertinoActivityIndicator(
                                                      color:
                                                          CupertinoColors.white,
                                                    ),
                                              )
                                            : const Text('Sign In'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: theme.colorScheme.mutedForeground,
                                    ),
                                  ),
                                  CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    onPressed: () => context.go('/register'),
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: theme.colorScheme.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInputField({
    required BuildContext context,
    required String label,
    required TextEditingController controller,
    required String placeholder,
    TextInputType? keyboardType,
    required String? Function(String) validator,
  }) {
    final theme = ShadTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              lucide.LucideIcons.mail,
              size: 16,
              color: theme.colorScheme.mutedForeground,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.foreground,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ShadInputFormField(
          id: label.toLowerCase(),
          controller: controller,
          placeholder: Text(placeholder),
          keyboardType: keyboardType,
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required BuildContext context,
    required String label,
    required TextEditingController controller,
    required String placeholder,
    required bool obscureText,
    required VoidCallback onToggle,
    required String? Function(String) validator,
  }) {
    final theme = ShadTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              lucide.LucideIcons.lock,
              size: 16,
              color: theme.colorScheme.mutedForeground,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.foreground,
              ),
            ),
            const Spacer(),
            CupertinoButton(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              onPressed: onToggle,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    obscureText
                        ? lucide.LucideIcons.eye
                        : lucide.LucideIcons.eyeOff,
                    size: 16,
                    color: theme.colorScheme.mutedForeground,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    obscureText ? 'Show' : 'Hide',
                    style: TextStyle(
                      fontSize: 13,
                      color: theme.colorScheme.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ShadInputFormField(
          id: label.toLowerCase(),
          controller: controller,
          placeholder: Text(placeholder),
          obscureText: obscureText,
          validator: validator,
        ),
      ],
    );
  }
}
