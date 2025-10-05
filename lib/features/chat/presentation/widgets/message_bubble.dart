import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../domain/entities/message.dart';

class MessageBubble extends StatefulWidget {
  final Message message;
  final bool isStreaming;

  const MessageBubble({
    super.key,
    required this.message,
    this.isStreaming = false,
  });

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool _isCopied = false;

  void _handleCopy(BuildContext context, ShadThemeData theme) {
    Clipboard.setData(ClipboardData(text: widget.message.content));
    setState(() {
      _isCopied = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Copied to clipboard'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: theme.colorScheme.primary,
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isCopied = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isUser = widget.message.isUser;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: isUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isUser ? theme.colorScheme.primary : null,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MarkdownBody(
                        data: widget.message.content,
                        styleSheet: MarkdownStyleSheet(
                          p: TextStyle(
                            color: isUser
                                ? theme.colorScheme.primaryForeground
                                : theme.colorScheme.foreground,
                            fontSize: 15,
                          ),
                          strong: TextStyle(
                            color: isUser
                                ? theme.colorScheme.primaryForeground
                                : theme.colorScheme.foreground,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          h1: TextStyle(
                            color: isUser
                                ? theme.colorScheme.primaryForeground
                                : theme.colorScheme.foreground,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          h2: TextStyle(
                            color: isUser
                                ? theme.colorScheme.primaryForeground
                                : theme.colorScheme.foreground,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          h3: TextStyle(
                            color: isUser
                                ? theme.colorScheme.primaryForeground
                                : theme.colorScheme.foreground,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          listBullet: TextStyle(
                            color: isUser
                                ? theme.colorScheme.primaryForeground
                                : theme.colorScheme.foreground,
                            fontSize: 15,
                          ),
                          code: TextStyle(
                            color: isUser
                                ? theme.colorScheme.primaryForeground
                                : theme.colorScheme.foreground,
                            fontSize: 14,
                            fontFamily: 'monospace',
                            backgroundColor:
                                (isUser
                                        ? theme.colorScheme.primaryForeground
                                        : theme.colorScheme.foreground)
                                    .withValues(alpha: 0.1),
                          ),
                          blockquote: TextStyle(
                            color: isUser
                                ? theme.colorScheme.primaryForeground
                                      .withValues(alpha: 0.8)
                                : theme.colorScheme.foreground.withValues(
                                    alpha: 0.8,
                                  ),
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      if (widget.message.hasToolCalls) ...[
                        const SizedBox(height: 12),
                        _buildToolCallsInfo(theme),
                      ],
                    ],
                  ),
                ),
                if (!isUser && !widget.isStreaming) ...[
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: GestureDetector(
                      onTap: () => _handleCopy(context, theme),
                      child: Icon(
                        _isCopied
                            ? lucide.LucideIcons.check
                            : lucide.LucideIcons.copy,
                        size: 14,
                        color: theme.colorScheme.mutedForeground,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolCallsInfo(ShadThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.colorScheme.background.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.border.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                lucide.LucideIcons.wrench,
                size: 14,
                color: theme.colorScheme.mutedForeground,
              ),
              const SizedBox(width: 6),
              Text(
                'Tools used:',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.mutedForeground,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ...widget.message.toolCalls.map(
            (tool) => Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                '• ${_formatToolName(tool.name)}',
                style: TextStyle(
                  fontSize: 11,
                  color: theme.colorScheme.mutedForeground,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatToolName(String name) {
    return name
        .replaceAll('_', ' ')
        .split(' ')
        .map(
          (word) => word.isEmpty
              ? ''
              : word[0].toUpperCase() + word.substring(1).toLowerCase(),
        )
        .join(' ');
  }
}
