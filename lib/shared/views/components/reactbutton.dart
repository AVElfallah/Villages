import 'package:flutter/material.dart';

class ReactButton extends StatelessWidget {
  final List<PopupMenuItem> menuItems;

  const ReactButton({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        // Show the menu at the tap position
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;
        final RelativeRect position = RelativeRect.fromLTRB(
          details.globalPosition.dx,
          details.globalPosition.dy,
          overlay.size.width - details.globalPosition.dx,
          overlay.size.height - details.globalPosition.dy,
        );
        showMenu(
          context: context,
          position: position,
          items: menuItems,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.thumb_up, color: Colors.blue),
            SizedBox(width: 4),
            Text('Like'),
          ],
        ),
      ),
    );
  }
}
