import 'package:flutter/material.dart';
import 'package:ich_web/l10n/app_localizations.dart';

class DisplayPrediction extends StatelessWidget {
  final Map<String, dynamic>? responseData;

  const DisplayPrediction({super.key, required this.responseData});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFF1B1E25),
            borderRadius: BorderRadius.circular(20.0),
          ),
          alignment: Alignment.center,
          child: responseData != null
              ? _buildPredictionContent(responseData!, appLocalizations)
              : DefaultMessage(appLocalizations: appLocalizations),
        ),
      ],
    );
  }

  Widget _buildPredictionContent(Map<String, dynamic> responseData, AppLocalizations appLocalizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        PredictionText(
          label: appLocalizations.prediction,
          value: responseData['is_positive'] == true ? appLocalizations.positive : appLocalizations.negative,
          valueColor: responseData['is_positive'] == true ? Colors.green.shade300 : Colors.red.shade300,
        ),
        const SizedBox(height: 30),
        PredictionHeader(text: appLocalizations.predictionDetails),
        const SizedBox(height: 8),
        if (responseData['classification'] != null)
          ClassificationDetails(classification: responseData['classification']),
      ],
    );
  }
}

class DefaultMessage extends StatelessWidget {
  final AppLocalizations appLocalizations;

  const DefaultMessage({super.key, required this.appLocalizations});

  @override
  Widget build(BuildContext context) {
    return Text(
      appLocalizations.classificationResultWillDisplayHere,
      style: const TextStyle(color: Colors.white),
    );
  }
}

class PredictionText extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const PredictionText({
    super.key,
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: valueColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class PredictionHeader extends StatelessWidget {
  final String text;

  const PredictionHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 13),
    );
  }
}

class ClassificationDetails extends StatelessWidget {
  final Map<String, dynamic> classification;

  const ClassificationDetails({super.key, required this.classification});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: classification.entries.map(
        (entry) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text(
            '${entry.key}: ${entry.value.toStringAsFixed(4)}',
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ).toList(),
    );
  }
}