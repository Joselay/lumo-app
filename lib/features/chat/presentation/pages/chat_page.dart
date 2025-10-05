import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Scaffold, GlobalKey, ScaffoldState, Drawer, Colors, Material;
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
import '../widgets/chat_session_drawer.dart';
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
        child: Center(child: CupertinoActivityIndicator()),
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(const ChatEvent.loadSessions());
    context.read<ChatBloc>().add(const ChatEvent.loadArchivedSessions());
  }

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
    final chatBloc = context.read<ChatBloc>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: BlocProvider.value(
          value: chatBloc,
          child: const ChatSessionDrawer(),
        ),
      ),
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: theme.colorScheme.background,
          border: Border(
            bottom: BorderSide(color: theme.colorScheme.border, width: 0.5),
          ),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Icon(
                  lucide.LucideIcons.menu,
                  size: 24,
                  color: theme.colorScheme.foreground,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Lumo',
                style: TextStyle(
                  color: theme.colorScheme.foreground,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  context.read<ChatBloc>().add(const ChatEvent.createNewSession());
                },
                child: Icon(
                  lucide.LucideIcons.badgePlus,
                  size: 22,
                  color: theme.colorScheme.foreground,
                ),
              ),
              const SizedBox(width: 8),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => _showChatMenu(context, theme),
                child: Icon(
                  lucide.LucideIcons.moreHorizontal,
                  size: 22,
                  color: theme.colorScheme.foreground,
                ),
              ),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: BlocConsumer<ChatBloc, ChatState>(
                  listener: (context, state) {
                    if (state.status == ChatStatus.success ||
                        state.status == ChatStatus.sending ||
                        state.status == ChatStatus.streaming ||
                        state.status == ChatStatus.executingTools) {
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
                                context.read<ChatBloc>().add(
                                  const ChatEvent.clearError(),
                                );
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
                      itemCount:
                          state.messages.length +
                          (state.status == ChatStatus.executingTools ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (state.status == ChatStatus.executingTools &&
                            index == state.messages.length) {
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
                  if (state.messages.isEmpty) {
                    return _buildSuggestionPrompts(theme);
                  }
                  return const SizedBox.shrink();
                },
              ),
              BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  return ChatInput(
                    onSend: (message) {
                      context.read<ChatBloc>().add(
                        ChatEvent.sendMessage(message),
                      );
                    },
                    isLoading: state.status == ChatStatus.sending ||
                        state.status == ChatStatus.streaming ||
                        state.status == ChatStatus.executingTools,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(ShadThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo-transparent.png',
            width: 50,
            height: 50,
          ),
          const SizedBox(height: 24),
          Text(
            'Hi, I\'m Lumo.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.foreground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'How can I help you today?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.mutedForeground,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionPrompts(ShadThemeData theme) {
    final suggestions = [
      {'line1': 'Find movies', 'line2': 'playing in theaters today'},
      {'line1': 'Popular movies', 'line2': 'What\'s trending right now?'},
      {'line1': 'Book tickets', 'line2': 'Reserve seats for a movie'},
      {'line1': 'My bookings', 'line2': 'View all reservations'},
    ];

    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: suggestions.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          final fullMessage = '${suggestion['line1']}: ${suggestion['line2']}';

          return GestureDetector(
            onTap: () {
              context.read<ChatBloc>().add(
                ChatEvent.sendMessage(fullMessage),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: theme.colorScheme.muted,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    suggestion['line1']!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.foreground,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    suggestion['line2']!,
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
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

  void _showChatMenu(BuildContext context, ShadThemeData theme) {
    final state = context.read<ChatBloc>().state;
    final sessionId = state.sessionId;

    if (sessionId == null) return;

    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.black.withValues(alpha: 0.0),
        transitionDuration: const Duration(milliseconds: 150),
        reverseTransitionDuration: const Duration(milliseconds: 150),
        pageBuilder: (ctx, _, __) => Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(ctx),
              child: Container(color: const Color(0x00000000)),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 44 + 8,
              right: 16,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: theme.colorScheme.border),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.foreground.withValues(alpha: 0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildMenuItem(
                        theme,
                        'Rename',
                        lucide.LucideIcons.pencil,
                        () {
                          Navigator.pop(ctx);
                          _showRenameDialog(context, sessionId);
                        },
                        false,
                      ),
                      Container(height: 0.5, color: theme.colorScheme.border),
                      _buildMenuItem(
                        theme,
                        'Archive',
                        lucide.LucideIcons.archive,
                        () {
                          Navigator.pop(ctx);
                          _showArchiveConfirmation(context, sessionId);
                        },
                        false,
                      ),
                      Container(height: 0.5, color: theme.colorScheme.border),
                      _buildMenuItem(
                        theme,
                        'Delete',
                        lucide.LucideIcons.trash2,
                        () {
                          Navigator.pop(ctx);
                          _showDeleteConfirmation(context, sessionId);
                        },
                        true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  Widget _buildMenuItem(
    ShadThemeData theme,
    String title,
    IconData icon,
    VoidCallback onTap,
    bool isDestructive,
  ) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      onPressed: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: isDestructive
                ? theme.colorScheme.destructive
                : theme.colorScheme.foreground,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: isDestructive
                  ? theme.colorScheme.destructive
                  : theme.colorScheme.foreground,
            ),
          ),
        ],
      ),
    );
  }

  void _showRenameDialog(BuildContext context, String sessionId) {
    final controller = TextEditingController();
    final state = context.read<ChatBloc>().state;
    final session = state.sessions.firstWhere(
      (s) => s.id == sessionId,
      orElse: () => state.sessions.first,
    );

    controller.text = session.title.isEmpty ? '' : session.title;

    showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('Rename Chat'),
        content: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CupertinoTextField(
            controller: controller,
            placeholder: 'Enter new name',
            autofocus: true,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              final newTitle = controller.text.trim();
              if (newTitle.isNotEmpty) {
                context.read<ChatBloc>().add(
                  ChatEvent.renameSession(sessionId, newTitle),
                );
              }
              Navigator.pop(ctx);
            },
            child: const Text('Rename'),
          ),
        ],
      ),
    );
  }

  void _showArchiveConfirmation(BuildContext context, String sessionId) {
    final state = context.read<ChatBloc>().state;
    final session = state.sessions.firstWhere(
      (s) => s.id == sessionId,
      orElse: () => state.sessions.first,
    );

    showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('Archive Chat'),
        content: Text(
          'Are you sure you want to archive "${session.title.isEmpty ? 'New Chat' : session.title}"?',
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              context.read<ChatBloc>().add(
                ChatEvent.archiveSession(sessionId),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Archive'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, String sessionId) {
    final state = context.read<ChatBloc>().state;
    final session = state.sessions.firstWhere(
      (s) => s.id == sessionId,
      orElse: () => state.sessions.first,
    );

    showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('Delete Chat'),
        content: Text(
          'Are you sure you want to delete "${session.title.isEmpty ? 'New Chat' : session.title}"?',
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
              context.read<ChatBloc>().add(
                ChatEvent.deleteSession(sessionId),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
