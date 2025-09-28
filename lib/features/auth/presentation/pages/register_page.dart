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

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        loginUseCase: LoginUseCase(AuthRepository()),
        registerUseCase: RegisterUseCase(AuthRepository()),
      ),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  final _formKey = GlobalKey<ShadFormState>();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscurePasswordConfirm = true;

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      context.read<AuthBloc>().add(
        RegisterButtonPressed(
          email: _emailController.text.trim(),
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          password: _passwordController.text,
          passwordConfirm: _passwordConfirmController.text,
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
              title: const Text('Registration Failed'),
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
            navigationBar: CupertinoNavigationBar(
              middle: const Text('Create Account'),
              backgroundColor: Colors.transparent,
              border: null,
              leading: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => context.go('/login'),
                child: const Icon(CupertinoIcons.back),
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    Column(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Join Lumo Cinema',
                          style: ShadTheme.of(context).textTheme.h1,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Create your account to start booking movies',
                          style: ShadTheme.of(context).textTheme.muted,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    ShadForm(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildInputField(
                            label: 'Email',
                            controller: _emailController,
                            placeholder: 'Enter your email',
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

                          const SizedBox(height: 16),

                          Row(
                            children: [
                              Expanded(
                                child: _buildInputField(
                                  label: 'First Name',
                                  controller: _firstNameController,
                                  placeholder: 'First name',
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'First name is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildInputField(
                                  label: 'Last Name',
                                  controller: _lastNameController,
                                  placeholder: 'Last name',
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Last name is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          _buildPasswordField(
                            label: 'Password',
                            controller: _passwordController,
                            placeholder: 'Enter your password',
                            obscureText: _obscurePassword,
                            onToggleVisibility: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password is required';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),

                          _buildPasswordField(
                            label: 'Confirm Password',
                            controller: _passwordConfirmController,
                            placeholder: 'Confirm your password',
                            obscureText: _obscurePasswordConfirm,
                            onToggleVisibility: () {
                              setState(() {
                                _obscurePasswordConfirm =
                                    !_obscurePasswordConfirm;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 32),

                          ShadButton(
                            onPressed: isLoading ? null : _handleRegister,
                            width: double.infinity,
                            child: isLoading
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CupertinoActivityIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text('Create Account'),
                          ),

                          const SizedBox(height: 24),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: ShadTheme.of(context).textTheme.small,
                              ),
                              ShadButton.ghost(
                                onPressed: () => context.go('/login'),
                                child: Text(
                                  'Sign in',
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

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String placeholder,
    TextInputType? keyboardType,
    required String? Function(String) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: ShadTheme.of(
            context,
          ).textTheme.small.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        ShadInputFormField(
          id: label.toLowerCase().replaceAll(' ', '_'),
          controller: controller,
          placeholder: Text(placeholder),
          keyboardType: keyboardType,
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required String placeholder,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
    required String? Function(String) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: ShadTheme.of(
            context,
          ).textTheme.small.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        ShadInputFormField(
          id: label.toLowerCase().replaceAll(' ', '_'),
          controller: controller,
          placeholder: Text(placeholder),
          obscureText: obscureText,
          validator: validator,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CupertinoButton(
            padding: const EdgeInsets.only(top: 8),
            minimumSize: Size.zero,
            onPressed: onToggleVisibility,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  size: 16,
                  color: ShadTheme.of(context).colorScheme.mutedForeground,
                ),
                const SizedBox(width: 4),
                Text(
                  obscureText ? 'Show' : 'Hide',
                  style: ShadTheme.of(context).textTheme.small.copyWith(
                    color: ShadTheme.of(context).colorScheme.mutedForeground,
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
