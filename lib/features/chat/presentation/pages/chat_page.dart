import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../../core/services/auth_service.dart';
import '../../data/repositories/chat_repository.dart';
import '../viewmodels/chat_bloc.dart';
import '../viewmodels/chat_event.dart';
import '../viewmodels/chat_state.dart';
import '../widgets/chat_input.dart';
import '../widgets/message_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool _isLoggedIn = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final isLoggedIn = await AuthService.isLoggedIn();
    setState(() {
      _isLoggedIn = isLoggedIn;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const CupertinoPageScaffold(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }

    if (!_isLoggedIn) {
      return _buildAuthRequired(context);
    }

    return BlocProvider(
      create: (context) => ChatBloc(repository: ChatRepository()),
      child: const _ChatView(),
    );
  }

  Widget _buildAuthRequired(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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
                      lucide.LucideIcons.messageCircle,
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
                    'Create an account or sign in to chat with our AI assistant and get help with movie bookings.',
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
}

class _ChatView extends StatefulWidget {
  const _ChatView();

  @override
  State<_ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<_ChatView> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: theme.colorScheme.background,
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.border,
            width: 0.5,
          ),
        ),
        middle: Text(
          'AI Assistant',
          style: TextStyle(
            color: theme.colorScheme.foreground,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state.messages.isEmpty) return const SizedBox.shrink();

            return CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (ctx) => CupertinoAlertDialog(
                    title: const Text('Clear Chat'),
                    content: const Text(
                      'Are you sure you want to clear all messages?',
                    ),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text('Cancel'),
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          context.read<ChatBloc>().add(const ChatEvent.clearMessages());
                          Navigator.pop(ctx);
                        },
                        child: const Text('Clear'),
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                'Clear',
                style: TextStyle(
                  color: theme.colorScheme.destructive,
                  fontSize: 15,
                ),
              ),
            );
          },
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocConsumer<ChatBloc, ChatState>(
                listener: (context, state) {
                  if (state.status == ChatStatus.success ||
                      state.status == ChatStatus.sending) {
                    _scrollToBottom();
                  }

                  if (state.status == ChatStatus.error &&
                      state.errorMessage.isNotEmpty) {
                    showCupertinoDialog(
                      context: context,
                      builder: (ctx) => CupertinoAlertDialog(
                        title: const Text('Error'),
                        content: Text(state.errorMessage),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () {
                              context.read<ChatBloc>().add(const ChatEvent.clearError());
                              Navigator.pop(ctx);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state.messages.isEmpty) {
                    return _buildEmptyState(theme);
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    itemCount: state.messages.length + (state.status == ChatStatus.executingTools ? 1 : 0),
                    itemBuilder: (context, index) {
                      // Show loading indicator if executing tools and at last position
                      if (state.status == ChatStatus.executingTools && index == state.messages.length) {
                        return _buildToolExecutionIndicator(theme);
                      }

                      final message = state.messages[index];
                      return MessageBubble(message: message);
                    },
                  );
                },
              ),
            ),
            BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                return ChatInput(
                  onSend: (message) {
                    context.read<ChatBloc>().add(ChatEvent.sendMessage(message));
                  },
                  isLoading: state.status == ChatStatus.sending,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(ShadThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                CupertinoIcons.chat_bubble_2,
                size: 40,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'AI Assistant',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.foreground,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Ask me about movies, showtimes, or book tickets!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: theme.colorScheme.mutedForeground,
              ),
            ),
            const SizedBox(height: 32),
            _buildSuggestionChips(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionChips(ShadThemeData theme) {
    final suggestions = [
      'Find movies playing today',
      'Book tickets for a movie',
      'What\'s popular right now?',
      'Show my bookings',
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: suggestions.map((suggestion) {
        return GestureDetector(
          onTap: () {
            context.read<ChatBloc>().add(ChatEvent.sendMessage(suggestion));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.muted,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: theme.colorScheme.border,
              ),
            ),
            child: Text(
              suggestion,
              style: TextStyle(
                fontSize: 13,
                color: theme.colorScheme.foreground,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildToolExecutionIndicator(ShadThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              lucide.LucideIcons.bot,
              size: 20,
              color: theme.colorScheme.secondary,
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.muted,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CupertinoActivityIndicator(
                      radius: 8,
                      color: theme.colorScheme.foreground,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Searching...',
                    style: TextStyle(
                      color: theme.colorScheme.foreground,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
