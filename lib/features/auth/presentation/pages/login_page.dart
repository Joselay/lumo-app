import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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

class _LoginViewState extends State<_LoginView> {
  final _formKey = GlobalKey<ShadFormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
            navigationBar: const CupertinoNavigationBar(
              middle: Text('Login'),
              backgroundColor: Colors.transparent,
              border: null,
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),

                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: ShadTheme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Welcome back',
                          style: ShadTheme.of(context).textTheme.h1,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Please sign in to your account',
                          style: ShadTheme.of(context).textTheme.muted,
                        ),
                      ],
                    ),

                    const SizedBox(height: 48),

                    ShadForm(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: ShadTheme.of(context).textTheme.small
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 8),
                              ShadInputFormField(
                                id: 'email',
                                controller: _emailController,
                                placeholder: const Text('Enter your email'),
                                keyboardType: TextInputType.emailAddress,
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
                            ],
                          ),

                          const SizedBox(height: 16),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Password',
                                style: ShadTheme.of(context).textTheme.small
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 8),
                              ShadInputFormField(
                                id: 'password',
                                controller: _passwordController,
                                placeholder: const Text('Enter your password'),
                                obscureText: _obscurePassword,
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
                              Align(
                                alignment: Alignment.centerRight,
                                child: CupertinoButton(
                                  padding: const EdgeInsets.only(top: 8),
                                  minimumSize: Size.zero,
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        _obscurePassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: 16,
                                        color: ShadTheme.of(
                                          context,
                                        ).colorScheme.mutedForeground,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        _obscurePassword ? 'Show' : 'Hide',
                                        style: ShadTheme.of(context)
                                            .textTheme
                                            .small
                                            .copyWith(
                                              color: ShadTheme.of(
                                                context,
                                              ).colorScheme.mutedForeground,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          Align(
                            alignment: Alignment.centerRight,
                            child: ShadButton.ghost(
                              onPressed: () {
                                showCupertinoDialog(
                                  context: context,
                                  builder: (context) => CupertinoAlertDialog(
                                    title: const Text('Forgot Password'),
                                    content: const Text(
                                      'Forgot password feature will be implemented soon.',
                                    ),
                                    actions: [
                                      CupertinoDialogAction(
                                        child: const Text('OK'),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot password?',
                                style: ShadTheme.of(context).textTheme.small
                                    .copyWith(
                                      color: ShadTheme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 32),

                          ShadButton(
                            onPressed: isLoading ? null : _handleLogin,
                            width: double.infinity,
                            child: isLoading
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CupertinoActivityIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text('Sign In'),
                          ),

                          const SizedBox(height: 24),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: ShadTheme.of(context).textTheme.small,
                              ),
                              ShadButton.ghost(
                                onPressed: () => context.go('/register'),
                                child: Text(
                                  'Sign up',
                                  style: ShadTheme.of(context).textTheme.small
                                      .copyWith(
                                        color: ShadTheme.of(
                                          context,
                                        ).colorScheme.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
}
