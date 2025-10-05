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
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: theme.colorScheme.muted,
                shape: BoxShape.circle,
              ),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  // TODO: Implement plus button functionality
                },
                child: Icon(
                  lucide.LucideIcons.plus,
                  size: 22,
                  color: theme.colorScheme.foreground,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 44,
                  maxHeight: 120,
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    CupertinoTextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      placeholder: 'Ask anything',
                      maxLines: null,
                      textInputAction: TextInputAction.send,
                      enabled: !widget.isLoading,
                      onSubmitted: (_) => _handleSend(),
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 88,
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.muted,
                        borderRadius: BorderRadius.circular(18),
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
                    Positioned(
                      right: 44,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.muted,
                          shape: BoxShape.circle,
                        ),
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            // TODO: Implement microphone functionality
                          },
                          child: Icon(
                            lucide.LucideIcons.mic,
                            size: 20,
                            color: theme.colorScheme.mutedForeground,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 4,
                      child: Container(
                        width: 36,
                        height: 36,
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
                                  width: 16,
                                  height: 16,
                                  child: CupertinoActivityIndicator(
                                    radius: 6,
                                    color: theme.colorScheme.primaryForeground,
                                  ),
                                )
                              : Icon(
                                  lucide.LucideIcons.arrowUp,
                                  size: 20,
                                  color: theme.colorScheme.primaryForeground,
                                ),
                        ),
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
}
