import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardMotelValue extends StatelessWidget {
  final String timeFormatted;
  final double value;
  final double totalValue;
  final double? discount;

  CardMotelValue({
    super.key,
    required this.timeFormatted,
    required this.value,
    required this.totalValue,
    this.discount,
  });

  final _formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: ListTile(
        title: Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              timeFormatted,
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey.shade800,
              ),
            ),
            if (discount != null)
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  border: Border.all(
                    color: Colors.green,
                  ),
                ),
                child: Text(
                  '$discount% off',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              )
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                discount != null
                    ? _formatter.format(totalValue)
                    : _formatter.format(value),
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                ),
              ),
              if (discount != null)
                Text(
                  _formatter.format(value),
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey.shade800,
                  ),
                ),
            ],
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          size: 28,
        ),
        contentPadding: EdgeInsets.only(
          left: 20,
          right: 8,
        ),
      ),
    );
  }
}
