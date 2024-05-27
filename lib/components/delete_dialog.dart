import 'package:flutter/material.dart';

class DeleteDialog extends StatefulWidget {
  const DeleteDialog({super.key, required this.title, required this.subtitle, required this.cancel, required this.accept});

  final String title;
  final String subtitle;
  final VoidCallback cancel;
  final VoidCallback accept;

  @override
  State<DeleteDialog> createState() => _DeleteAllDialogState();
}

class _DeleteAllDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
            backgroundColor: Theme.of(context).colorScheme.surface,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              padding: EdgeInsets.all(25),
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      // Subtitle
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                      ),
                    ],
                  ),

                  // Row of button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // button cancel
                      TextButton(
                        onPressed: widget.cancel,
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.surface),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2),
                            ),
                          ),
                        ),
                        child: Text(
                          'Naah, just kidding',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      // button accept
                      TextButton(
                        onPressed: widget.accept,
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.primary),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2),
                            ),
                          ),
                        ),
                        child: Text(
                          'Yeah, of course!',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );;
  }
}