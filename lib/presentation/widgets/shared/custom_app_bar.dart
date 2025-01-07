import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              const Icon(Icons.menu),
              const Spacer(),
              Text(
                'Market Paisa',
                style: titleStyle?.copyWith(color: colors.primary),
              ),
              const Spacer(),
              const Icon(Icons.search),
            ],
          ),
        ),
      ),
    );
  }
}
