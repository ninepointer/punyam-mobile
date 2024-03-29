import 'dart:ffi';

import 'package:flutter/widgets.dart';

class AppConstants {
  static const String appName = 'Punyam';

  static const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTlmY2U1NjRlMjUxNDU3MmExNjA1MGIiLCJpYXQiOjE3MDUwNDg0OTl9.fsFAF1ZgC5vr5VHdzC6omKiBxY4hiIUkNnLUE0AvhHI";
  static const String equityTraderType = "Equity Trader";
  static const String buy = "BUY";
  static const String sell = "SELL";
  static const String complete = "COMPLETE";

  static EdgeInsets getAppPadding(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double horizontalpadding = screenWidth * 0.05;
    final double verticalpadding = screenWidth * 0.03;

    return EdgeInsets.symmetric(
        horizontal: horizontalpadding, vertical: verticalpadding);
  }
}

enum PaymentTransactionType {
  credit,
  debit,
}

enum TransactionType {
  buy,
  sell,
  exit,
}

enum ProductType {
  tenx,
  virtual,
  marginx,
  contest,
  battle,
  collegeContest,
  internship,
  wallet,
}
