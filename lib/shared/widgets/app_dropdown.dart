import 'package:flutter/material.dart';

enum SortOrder { choose, ascending, descending }

class SortDropdown extends StatelessWidget {
  final SortOrder selectedValue;
  final ValueChanged<SortOrder> onChanged;

  const SortDropdown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<SortOrder>(
      value: selectedValue,
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
      items: const [
        DropdownMenuItem(value: SortOrder.choose, child: Text("Choose")),
        DropdownMenuItem(value: SortOrder.ascending, child: Text("Ascending")),
        DropdownMenuItem(
          value: SortOrder.descending,
          child: Text("Descending"),
        ),
      ],
    );
  }
}
