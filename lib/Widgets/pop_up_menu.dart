import 'package:flutter/material.dart';

import '../Models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoredTaskCallback;
  const PopupMenu({
    super.key,
    required this.cancelOrDeleteCallback,
    required this.task,
    required this.likeOrDislikeCallback,
    required this.editTaskCallback,
    required this.restoredTaskCallback,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? ((context) => [
                PopupMenuItem(
                  onTap: null,
                  child: TextButton.icon(
                      onPressed: editTaskCallback,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit')),
                ),
                PopupMenuItem(
                  onTap: likeOrDislikeCallback,
                  child: TextButton.icon(
                      onPressed: null,
                      icon: task.isFavorite == false
                          ? const Icon(Icons.bookmark_add_outlined)
                          : const Icon(Icons.bookmark_remove_outlined),
                      label: task.isDeleted == false
                          ? const Text('Add to \nBookmarks')
                          : const Text('Remove from \nBookmarks')),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete')),
                  onTap: () => cancelOrDeleteCallback,
                ),
              ])
          : (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.restore_from_trash),
                      label: const Text('Restore')),
                  onTap: () => restoredTaskCallback,
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete Forever')),
                  onTap: () => cancelOrDeleteCallback,
                ),
              ],
    );
  }
}
