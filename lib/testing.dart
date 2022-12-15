import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import 'common/utility/colors.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

List<StoryItem> storyitem = [];

class _TestingState extends State<Testing> {
  final StoryController controller = StoryController();

  @override
  void initState() {
    super.initState();
    loadstoryitems();
  }

  loadstoryitems() {
    storyitem.addAll([
      StoryItem.text(title: 'hello', backgroundColor: backgroundColor),
      StoryItem.text(title: 'hello there', backgroundColor: Colors.red.shade100)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Page'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pop(true),
              icon: const Icon(Icons.keyboard_return))
        ],
      ),
      body: StoryView(
        storyItems: storyitem,
        controller: controller,
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
