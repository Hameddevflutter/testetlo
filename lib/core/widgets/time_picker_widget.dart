import 'package:flutter/material.dart';

class MyTimePickerDialog extends StatefulWidget {
  const MyTimePickerDialog({super.key});

  @override
  MyTimePickerDialogState createState() => MyTimePickerDialogState();
}

class MyTimePickerDialogState extends State<MyTimePickerDialog> {
  TimeOfDay? _selectedTime;

  Future<void> _selectTime(final BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(final BuildContext context) => AlertDialog(
        title: const Text('Select Time'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text('Select Time'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _selectedTime != null
                  ? 'Selected Time: ${_selectedTime!.format(context)}'
                  : 'No time selected',
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop("${_selectedTime!.hour}:${_selectedTime!.minute}");
            },
            child: const Text('Set Time'),
          ),
        ],
      );
}
