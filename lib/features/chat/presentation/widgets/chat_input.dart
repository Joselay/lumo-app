import 'package:flutter/cupertino.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import 'package:shadcn_ui/shadcn_ui.dart';

class ChatInput extends StatefulWidget {
  final Function(String) onSend;
  final bool isLoading;

  const ChatInput({
    super.key,
    required this.onSend,
    this.isLoading = false,
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isEmpty || widget.isLoading) return;

    widget.onSend(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.border,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 44,
                  maxHeight: 120,
                ),
                child: CupertinoTextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  placeholder: 'Ask me anything about movies...',
                  maxLines: null,
                  textInputAction: TextInputAction.send,
                  enabled: !widget.isLoading,
                  onSubmitted: (_) => _handleSend(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.muted,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: theme.colorScheme.border,
                    ),
                  ),
                  style: TextStyle(
                    color: theme.colorScheme.foreground,
                    fontSize: 15,
                  ),
                  placeholderStyle: TextStyle(
                    color: theme.colorScheme.mutedForeground,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: widget.isLoading
                    ? theme.colorScheme.muted
                    : theme.colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: widget.isLoading ? null : _handleSend,
                child: widget.isLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CupertinoActivityIndicator(
                          radius: 8,
                          color: theme.colorScheme.primaryForeground,
                        ),
                      )
                    : Icon(
                        lucide.LucideIcons.send,
                        size: 20,
                        color: theme.colorScheme.primaryForeground,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
