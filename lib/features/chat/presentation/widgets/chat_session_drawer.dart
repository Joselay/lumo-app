import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../data/models/chat_models.dart';
import '../viewmodels/chat_bloc.dart';
import '../viewmodels/chat_event.dart';
import '../viewmodels/chat_state.dart';

class ChatSessionDrawer extends StatelessWidget {
  final VoidCallback? onSessionSelected;

  const ChatSessionDrawer({super.key, this.onSessionSelected});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        border: Border(
          right: BorderSide(color: theme.colorScheme.border, width: 1),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, theme),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  if (state.isLoadingSessions) {
                    return const Center(child: CupertinoActivityIndicator());
                  }

                  if (state.sessions.isEmpty) {
                    return _buildEmptyState(theme);
                  }

                  return _buildSessionsList(context, theme, state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ShadThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.border, width: 0.5),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Lumo',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.foreground,
          ),
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
            Icon(
              lucide.LucideIcons.messageCircle,
              size: 48,
              color: theme.colorScheme.mutedForeground,
            ),
            const SizedBox(height: 16),
            Text(
              'No chat history yet',
              style: TextStyle(
                fontSize: 16,
                color: theme.colorScheme.mutedForeground,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start a new conversation to see it here',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: theme.colorScheme.mutedForeground.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionsList(
    BuildContext context,
    ShadThemeData theme,
    ChatState state,
  ) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      children: [
        ...state.sessions.map((session) {
          final isActive = session.id == state.sessionId;
          return _buildSessionItem(context, theme, session, isActive, false);
        }),

        if (state.archivedSessions.isNotEmpty) ...[
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Icon(
                  lucide.LucideIcons.archive,
                  size: 16,
                  color: theme.colorScheme.mutedForeground,
                ),
                const SizedBox(width: 8),
                Text(
                  'Archived',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.mutedForeground,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          ...state.archivedSessions.map((session) {
            return _buildSessionItem(context, theme, session, false, true);
          }),
        ],

        if (state.sessions.isNotEmpty || state.archivedSessions.isNotEmpty) ...[
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ShadButton.outline(
              onPressed: () => _showDeleteAllConfirmation(context, theme),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    lucide.LucideIcons.trash2,
                    size: 16,
                    color: theme.colorScheme.destructive,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Delete All Conversations',
                    style: TextStyle(color: theme.colorScheme.destructive),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ],
    );
  }

  Widget _buildSessionItem(
    BuildContext context,
    ShadThemeData theme,
    ChatSession session,
    bool isActive,
    bool isArchived,
  ) {
    return GestureDetector(
      onTap: () {
        context.read<ChatBloc>().add(ChatEvent.loadSession(session.id));
        onSessionSelected?.call();
      },
      onLongPress: () =>
          _showSessionActions(context, theme, session, isArchived),
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: isActive ? theme.colorScheme.muted : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Text(
            session.title.isEmpty ? 'New Chat' : session.title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              color: isArchived
                  ? theme.colorScheme.foreground.withValues(alpha: 0.6)
                  : theme.colorScheme.foreground,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  void _showSessionActions(
    BuildContext context,
    ShadThemeData theme,
    ChatSession session,
    bool isArchived,
  ) async {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: false,
      builder: (dialogContext) =>
          const Center(child: CupertinoActivityIndicator(radius: 16)),
    );

    final chatBloc = context.read<ChatBloc>();
    final sessionDetail = await chatBloc.repository.getChatSession(session.id);

    if (context.mounted) {
      Navigator.of(context, rootNavigator: false).pop();
    }

    if (sessionDetail == null || !context.mounted) return;

    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      useRootNavigator: false,
      builder: (dialogCtx) => _buildPreviewDialog(
        context,
        dialogCtx,
        theme,
        session,
        sessionDetail,
        isArchived,
      ),
    );
  }

  Widget _buildPreviewDialog(
    BuildContext parentContext,
    BuildContext dialogContext,
    ShadThemeData theme,
    ChatSession session,
    ChatSessionDetail sessionDetail,
    bool isArchived,
  ) {
    return GestureDetector(
      onTap: () => Navigator.of(dialogContext, rootNavigator: false).pop(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                constraints: const BoxConstraints(
                  maxWidth: 500,
                  maxHeight: 400,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.foreground.withValues(
                        alpha: 0.1,
                      ),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  itemCount: sessionDetail.messages.length,
                  itemBuilder: (context, index) {
                    final message = sessionDetail.messages[index];
                    final isUser = message.role == 'user';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: isUser
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!isUser)
                            Container(
                              width: 28,
                              height: 28,
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.secondary.withValues(
                                  alpha: 0.2,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                lucide.LucideIcons.bot,
                                size: 14,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isUser
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.muted,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                message.content,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: isUser
                                      ? theme.colorScheme.primaryForeground
                                      : theme.colorScheme.foreground,
                                ),
                              ),
                            ),
                          ),
                          if (isUser)
                            Container(
                              width: 28,
                              height: 28,
                              margin: const EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withValues(
                                  alpha: 0.2,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                CupertinoIcons.person_fill,
                                size: 14,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                constraints: const BoxConstraints(maxWidth: 500),
                decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.foreground.withValues(
                        alpha: 0.1,
                      ),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      onPressed: () {
                        Navigator.of(dialogContext, rootNavigator: false).pop();
                        _showRenameDialog(parentContext, theme, session);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            lucide.LucideIcons.pencil,
                            size: 18,
                            color: theme.colorScheme.foreground,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Rename',
                            style: TextStyle(
                              fontSize: 16,
                              color: theme.colorScheme.foreground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(height: 0.5, color: theme.colorScheme.border),
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      onPressed: () {
                        Navigator.of(dialogContext, rootNavigator: false).pop();
                        if (isArchived) {
                          parentContext.read<ChatBloc>().add(
                            ChatEvent.unarchiveSession(session.id),
                          );
                        } else {
                          _showArchiveConfirmation(
                            parentContext,
                            theme,
                            session,
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isArchived
                                ? lucide.LucideIcons.archiveRestore
                                : lucide.LucideIcons.archive,
                            size: 18,
                            color: theme.colorScheme.foreground,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            isArchived ? 'Unarchive' : 'Archive',
                            style: TextStyle(
                              fontSize: 16,
                              color: theme.colorScheme.foreground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(height: 0.5, color: theme.colorScheme.border),
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      onPressed: () {
                        Navigator.of(dialogContext, rootNavigator: false).pop();
                        _showDeleteConfirmation(parentContext, theme, session);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            lucide.LucideIcons.trash2,
                            size: 18,
                            color: theme.colorScheme.destructive,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Delete',
                            style: TextStyle(
                              fontSize: 16,
                              color: theme.colorScheme.destructive,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRenameDialog(
    BuildContext context,
    ShadThemeData theme,
    ChatSession session,
  ) {
    final controller = TextEditingController(
      text: session.title.isEmpty ? '' : session.title,
    );

    showCupertinoDialog(
      context: context,
      useRootNavigator: false,
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
                  ChatEvent.renameSession(session.id, newTitle),
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

  void _showArchiveConfirmation(
    BuildContext context,
    ShadThemeData theme,
    ChatSession session,
  ) {
    showCupertinoDialog(
      context: context,
      useRootNavigator: false,
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
                ChatEvent.archiveSession(session.id),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Archive'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    ShadThemeData theme,
    ChatSession session,
  ) {
    final chatBloc = context.read<ChatBloc>();

    showCupertinoDialog(
      context: context,
      useRootNavigator: false,
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
              Navigator.pop(ctx);
              chatBloc.add(ChatEvent.deleteSession(session.id));
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showDeleteAllConfirmation(BuildContext context, ShadThemeData theme) {
    final chatBloc = context.read<ChatBloc>();

    showCupertinoDialog(
      context: context,
      useRootNavigator: false,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('Delete All Conversations'),
        content: const Text(
          'Are you sure you want to delete all conversations? This action cannot be undone.',
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
              Navigator.pop(ctx);
              chatBloc.add(const ChatEvent.deleteAllSessions());
            },
            child: const Text('Delete All'),
          ),
        ],
      ),
    );
  }
}
