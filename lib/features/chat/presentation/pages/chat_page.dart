import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../data/repositories/chat_repository.dart';
import '../viewmodels/chat_bloc.dart';
import '../viewmodels/chat_event.dart';
import '../viewmodels/chat_state.dart';
import '../widgets/chat_input.dart';
import '../widgets/message_bubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(repository: ChatRepository()),
      child: const _ChatView(),
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
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
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
}
