import 'package:erisiti/src/features/screens/dashboard/features/receipts/components/body.dart';
import 'package:flutter/material.dart';

import 'components/topbar.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [TopBar(), ReceiptReport()],
        ),
      ),
    );
  }
}
