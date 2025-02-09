// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Intracranial Hemorrhage Classification`
  String get appTitle {
    return Intl.message(
      'Intracranial Hemorrhage Classification',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get backToHome {
    return Intl.message(
      'Back to Home',
      name: 'backToHome',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get chooseLanguage {
    return Intl.message(
      'Choose Language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `What is an Intracranial Hemorrhage?`
  String get whatIsICH {
    return Intl.message(
      'What is an Intracranial Hemorrhage?',
      name: 'whatIsICH',
      desc: '',
      args: [],
    );
  }

  /// `Intracranial hemorrhage (ICH) is a general term for bleeding inside the skull. It encompasses all types of brain bleeds, including subdural, intraparenchymal, intraventricular, subarachnoid, and epidural hemorrhages. ICH is commonly caused by trauma, high blood pressure, blood vessel abnormalities, or aneurysms. The symptoms of ICH vary depending on the location and severity of the bleed, and can range from headaches and dizziness to loss of consciousness or death. Prompt medical attention is required to manage ICH, and the treatment approach depends on the cause, type, and severity of the hemorrhage.`
  String get ichDescription {
    return Intl.message(
      'Intracranial hemorrhage (ICH) is a general term for bleeding inside the skull. It encompasses all types of brain bleeds, including subdural, intraparenchymal, intraventricular, subarachnoid, and epidural hemorrhages. ICH is commonly caused by trauma, high blood pressure, blood vessel abnormalities, or aneurysms. The symptoms of ICH vary depending on the location and severity of the bleed, and can range from headaches and dizziness to loss of consciousness or death. Prompt medical attention is required to manage ICH, and the treatment approach depends on the cause, type, and severity of the hemorrhage.',
      name: 'ichDescription',
      desc: '',
      args: [],
    );
  }

  /// `Types of Intracranial Hemorrhage`
  String get typesOfICH {
    return Intl.message(
      'Types of Intracranial Hemorrhage',
      name: 'typesOfICH',
      desc: '',
      args: [],
    );
  }

  /// `Start Classification`
  String get startClassification {
    return Intl.message(
      'Start Classification',
      name: 'startClassification',
      desc: '',
      args: [],
    );
  }

  /// `Go to ICH Classification Page`
  String get goToICHClass {
    return Intl.message(
      'Go to ICH Classification Page',
      name: 'goToICHClass',
      desc: '',
      args: [],
    );
  }

  /// `Upload DICOM File`
  String get uploadDicomFile {
    return Intl.message(
      'Upload DICOM File',
      name: 'uploadDicomFile',
      desc: '',
      args: [],
    );
  }

  /// `Select DICOM File from Device`
  String get selectDicomFile {
    return Intl.message(
      'Select DICOM File from Device',
      name: 'selectDicomFile',
      desc: '',
      args: [],
    );
  }

  /// `File Selected:`
  String get fileSelected {
    return Intl.message(
      'File Selected:',
      name: 'fileSelected',
      desc: '',
      args: [],
    );
  }

  /// `Upload and Classify`
  String get uploadAndClassify {
    return Intl.message(
      'Upload and Classify',
      name: 'uploadAndClassify',
      desc: '',
      args: [],
    );
  }

  /// `Remove File`
  String get removeFile {
    return Intl.message(
      'Remove File',
      name: 'removeFile',
      desc: '',
      args: [],
    );
  }

  /// `Select Example DICOM File`
  String get selectExampleDicomFile {
    return Intl.message(
      'Select Example DICOM File',
      name: 'selectExampleDicomFile',
      desc: '',
      args: [],
    );
  }

  /// `Important Diagnostic Disclaimer`
  String get importantDiagnosticDisclaimer {
    return Intl.message(
      'Important Diagnostic Disclaimer',
      name: 'importantDiagnosticDisclaimer',
      desc: '',
      args: [],
    );
  }

  /// `This system is designed to assist in detecting and classifying intracranial hemorrhage using deep learning. The results can be used as a reference but are still recommended to be consulted with a professional healthcare provider.`
  String get uploadAndClassificationDescription {
    return Intl.message(
      'This system is designed to assist in detecting and classifying intracranial hemorrhage using deep learning. The results can be used as a reference but are still recommended to be consulted with a professional healthcare provider.',
      name: 'uploadAndClassificationDescription',
      desc: '',
      args: [],
    );
  }

  /// `HeatMap Detection`
  String get heatmapDetection {
    return Intl.message(
      'HeatMap Detection',
      name: 'heatmapDetection',
      desc: '',
      args: [],
    );
  }

  /// `Processed Image`
  String get processedImage {
    return Intl.message(
      'Processed Image',
      name: 'processedImage',
      desc: '',
      args: [],
    );
  }

  /// `Classification Result`
  String get classificationResult {
    return Intl.message(
      'Classification Result',
      name: 'classificationResult',
      desc: '',
      args: [],
    );
  }

  /// `No heatmap generated yet`
  String get noHeatmapGeneratedYet {
    return Intl.message(
      'No heatmap generated yet',
      name: 'noHeatmapGeneratedYet',
      desc: '',
      args: [],
    );
  }

  /// `No processed image available`
  String get noProcessedImageAvailable {
    return Intl.message(
      'No processed image available',
      name: 'noProcessedImageAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No Classification result available`
  String get noClassificationResultAvailable {
    return Intl.message(
      'No Classification result available',
      name: 'noClassificationResultAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No images available.`
  String get noImagesAvailable {
    return Intl.message(
      'No images available.',
      name: 'noImagesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Prediction: `
  String get prediction {
    return Intl.message(
      'Prediction: ',
      name: 'prediction',
      desc: '',
      args: [],
    );
  }

  /// `Positive`
  String get positive {
    return Intl.message(
      'Positive',
      name: 'positive',
      desc: '',
      args: [],
    );
  }

  /// `Negative`
  String get negative {
    return Intl.message(
      'Negative',
      name: 'negative',
      desc: '',
      args: [],
    );
  }

  /// `Prediction Details:`
  String get predictionDetails {
    return Intl.message(
      'Prediction Details:',
      name: 'predictionDetails',
      desc: '',
      args: [],
    );
  }

  /// `Classification result will display here.`
  String get classificationResultWillDisplayHere {
    return Intl.message(
      'Classification result will display here.',
      name: 'classificationResultWillDisplayHere',
      desc: '',
      args: [],
    );
  }

  /// `No heatmap data available.`
  String get noHeatmapDataAvailable {
    return Intl.message(
      'No heatmap data available.',
      name: 'noHeatmapDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Label: `
  String get label {
    return Intl.message(
      'Label: ',
      name: 'label',
      desc: '',
      args: [],
    );
  }

  /// `Confidence: `
  String get confidence {
    return Intl.message(
      'Confidence: ',
      name: 'confidence',
      desc: '',
      args: [],
    );
  }

  /// `Location:`
  String get location {
    return Intl.message(
      'Location:',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Causes:`
  String get causes {
    return Intl.message(
      'Causes:',
      name: 'causes',
      desc: '',
      args: [],
    );
  }

  /// `Characteristics:`
  String get characteristics {
    return Intl.message(
      'Characteristics:',
      name: 'characteristics',
      desc: '',
      args: [],
    );
  }

  /// `Symptoms:`
  String get symptoms {
    return Intl.message(
      'Symptoms:',
      name: 'symptoms',
      desc: '',
      args: [],
    );
  }

  /// `Previous Image`
  String get previousImage {
    return Intl.message(
      'Previous Image',
      name: 'previousImage',
      desc: '',
      args: [],
    );
  }

  /// `Next Image`
  String get nextImage {
    return Intl.message(
      'Next Image',
      name: 'nextImage',
      desc: '',
      args: [],
    );
  }

  /// `Example of Subdural Hemorrhage`
  String get exampleOfSubduralHemorrhage {
    return Intl.message(
      'Example of Subdural Hemorrhage',
      name: 'exampleOfSubduralHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `Example of Subarachnoid Hemorrhage`
  String get exampleOfSubarachnoidHemorrhage {
    return Intl.message(
      'Example of Subarachnoid Hemorrhage',
      name: 'exampleOfSubarachnoidHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `Example of Intraventricular Hemorrhage`
  String get exampleOfIntraventricularHemorrhage {
    return Intl.message(
      'Example of Intraventricular Hemorrhage',
      name: 'exampleOfIntraventricularHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `Example of Intraparenchymal Hemorrhage`
  String get exampleOfIntraparenchymalHemorrhage {
    return Intl.message(
      'Example of Intraparenchymal Hemorrhage',
      name: 'exampleOfIntraparenchymalHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `Example of Epidural Hemorrhage`
  String get exampleOfEpiduralHemorrhage {
    return Intl.message(
      'Example of Epidural Hemorrhage',
      name: 'exampleOfEpiduralHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `Subdural Hemorrhage`
  String get subduralHemorrhage {
    return Intl.message(
      'Subdural Hemorrhage',
      name: 'subduralHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `What is a Subdural Hemorrhage?`
  String get whatIsSubduralHemorrhage {
    return Intl.message(
      'What is a Subdural Hemorrhage?',
      name: 'whatIsSubduralHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `A subdural hemorrhage (SDH) occurs when blood collects between the dura mater (the outermost protective layer of the brain) and the arachnoid layer. This bleeding often happens after a head injury, such as a fall, car accident, or a hard blow to the head. In older adults or those who frequently consume alcohol, even a minor injury can cause this type of bleeding because the blood vessels around the brain become more fragile. The pooled blood can press on the brain and lead to serious complications if not treated promptly.`
  String get subduralDescription {
    return Intl.message(
      'A subdural hemorrhage (SDH) occurs when blood collects between the dura mater (the outermost protective layer of the brain) and the arachnoid layer. This bleeding often happens after a head injury, such as a fall, car accident, or a hard blow to the head. In older adults or those who frequently consume alcohol, even a minor injury can cause this type of bleeding because the blood vessels around the brain become more fragile. The pooled blood can press on the brain and lead to serious complications if not treated promptly.',
      name: 'subduralDescription',
      desc: '',
      args: [],
    );
  }

  /// `The bleeding occurs between the dura mater (the outermost brain layer) and the arachnoid layer.`
  String get subduralLocation {
    return Intl.message(
      'The bleeding occurs between the dura mater (the outermost brain layer) and the arachnoid layer.',
      name: 'subduralLocation',
      desc: '',
      args: [],
    );
  }

  /// `Head injuries, such as falls or car accidents, which cause small blood vessels around the brain to rupture.`
  String get subduralCause1 {
    return Intl.message(
      'Head injuries, such as falls or car accidents, which cause small blood vessels around the brain to rupture.',
      name: 'subduralCause1',
      desc: '',
      args: [],
    );
  }

  /// `In older adults or heavy alcohol users, even minor injuries can cause subdural bleeding due to brain shrinkage and fragile blood vessels.`
  String get subduralCause2 {
    return Intl.message(
      'In older adults or heavy alcohol users, even minor injuries can cause subdural bleeding due to brain shrinkage and fragile blood vessels.',
      name: 'subduralCause2',
      desc: '',
      args: [],
    );
  }

  /// `Blood spreads over the surface of the brain and follows the brain's shape, appearing convex on imaging scans.`
  String get subduralCharacteristic1 {
    return Intl.message(
      'Blood spreads over the surface of the brain and follows the brain\'s shape, appearing convex on imaging scans.',
      name: 'subduralCharacteristic1',
      desc: '',
      args: [],
    );
  }

  /// `It can occur suddenly (acute), develop slowly (subacute), or persist over weeks to months (chronic).`
  String get subduralCharacteristic2 {
    return Intl.message(
      'It can occur suddenly (acute), develop slowly (subacute), or persist over weeks to months (chronic).',
      name: 'subduralCharacteristic2',
      desc: '',
      args: [],
    );
  }

  /// `Acute SDH: Rapid loss of consciousness, sudden severe headache, and focal neurological deficits like weakness.`
  String get subduralSymptom1 {
    return Intl.message(
      'Acute SDH: Rapid loss of consciousness, sudden severe headache, and focal neurological deficits like weakness.',
      name: 'subduralSymptom1',
      desc: '',
      args: [],
    );
  }

  /// `Chronic SDH: Gradual headache, confusion, memory problems, or weakness in the body.`
  String get subduralSymptom2 {
    return Intl.message(
      'Chronic SDH: Gradual headache, confusion, memory problems, or weakness in the body.',
      name: 'subduralSymptom2',
      desc: '',
      args: [],
    );
  }

  /// `Subarachnoid Hemorrhage`
  String get subarachnoidHemorrhage {
    return Intl.message(
      'Subarachnoid Hemorrhage',
      name: 'subarachnoidHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `What is a Subarachnoid Hemorrhage?`
  String get whatIsSubarachnoidHemorrhage {
    return Intl.message(
      'What is a Subarachnoid Hemorrhage?',
      name: 'whatIsSubarachnoidHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `A subarachnoid hemorrhage (SAH) occurs when bleeding happens in the space between the arachnoid layer and the pia mater, two protective layers surrounding the brain. This space is normally filled with cerebrospinal fluid, which cushions the brain. SAH is often caused by the rupture of an aneurysm (a weak spot in a blood vessel) or other blood vessel abnormalities. The main symptom is a sudden, severe headache, often described as the 'worst headache of your life.' This condition is a medical emergency and requires immediate treatment.`
  String get subarachnoidDescription {
    return Intl.message(
      'A subarachnoid hemorrhage (SAH) occurs when bleeding happens in the space between the arachnoid layer and the pia mater, two protective layers surrounding the brain. This space is normally filled with cerebrospinal fluid, which cushions the brain. SAH is often caused by the rupture of an aneurysm (a weak spot in a blood vessel) or other blood vessel abnormalities. The main symptom is a sudden, severe headache, often described as the \'worst headache of your life.\' This condition is a medical emergency and requires immediate treatment.',
      name: 'subarachnoidDescription',
      desc: '',
      args: [],
    );
  }

  /// `The bleeding occurs in the subarachnoid space, between the arachnoid layer and the pia mater.`
  String get subarachnoidLocation {
    return Intl.message(
      'The bleeding occurs in the subarachnoid space, between the arachnoid layer and the pia mater.',
      name: 'subarachnoidLocation',
      desc: '',
      args: [],
    );
  }

  /// `Rupture of an aneurysm (a bulging weak spot in a blood vessel).`
  String get subarachnoidCause1 {
    return Intl.message(
      'Rupture of an aneurysm (a bulging weak spot in a blood vessel).',
      name: 'subarachnoidCause1',
      desc: '',
      args: [],
    );
  }

  /// `Rupture of an arteriovenous malformation (AVM), a tangle of abnormal blood vessels.`
  String get subarachnoidCause2 {
    return Intl.message(
      'Rupture of an arteriovenous malformation (AVM), a tangle of abnormal blood vessels.',
      name: 'subarachnoidCause2',
      desc: '',
      args: [],
    );
  }

  /// `Blood is seen in the subarachnoid space on imaging scans.`
  String get subarachnoidCharacteristic1 {
    return Intl.message(
      'Blood is seen in the subarachnoid space on imaging scans.',
      name: 'subarachnoidCharacteristic1',
      desc: '',
      args: [],
    );
  }

  /// `It can cause a sudden, severe headache, often described as a 'thunderclap headache.'`
  String get subarachnoidCharacteristic2 {
    return Intl.message(
      'It can cause a sudden, severe headache, often described as a \'thunderclap headache.\'',
      name: 'subarachnoidCharacteristic2',
      desc: '',
      args: [],
    );
  }

  /// `Sudden, severe headache, often described as the worst headache ever experienced.`
  String get subarachnoidSymptom1 {
    return Intl.message(
      'Sudden, severe headache, often described as the worst headache ever experienced.',
      name: 'subarachnoidSymptom1',
      desc: '',
      args: [],
    );
  }

  /// `Nausea and vomiting.`
  String get subarachnoidSymptom2 {
    return Intl.message(
      'Nausea and vomiting.',
      name: 'subarachnoidSymptom2',
      desc: '',
      args: [],
    );
  }

  /// `Stiff neck (nuchal rigidity).`
  String get subarachnoidSymptom3 {
    return Intl.message(
      'Stiff neck (nuchal rigidity).',
      name: 'subarachnoidSymptom3',
      desc: '',
      args: [],
    );
  }

  /// `Changes in mental status or loss of consciousness.`
  String get subarachnoidSymptom4 {
    return Intl.message(
      'Changes in mental status or loss of consciousness.',
      name: 'subarachnoidSymptom4',
      desc: '',
      args: [],
    );
  }

  /// `Intraventricular Hemorrhage`
  String get intraventricularHemorrhage {
    return Intl.message(
      'Intraventricular Hemorrhage',
      name: 'intraventricularHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `What is an Intraventricular Hemorrhage?`
  String get whatIsIntraventricularHemorrhage {
    return Intl.message(
      'What is an Intraventricular Hemorrhage?',
      name: 'whatIsIntraventricularHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `An intraventricular hemorrhage (IVH) occurs when bleeding happens inside the brain's ventricular system, which consists of fluid-filled spaces that produce and circulate cerebrospinal fluid. This type of bleeding is often caused by conditions like aneurysms, arteriovenous malformations (AVMs), or head trauma. The blood can block the flow of cerebrospinal fluid, leading to increased pressure inside the skull and potential brain damage. IVH is a serious condition that requires urgent medical attention.`
  String get intraventricularDescription {
    return Intl.message(
      'An intraventricular hemorrhage (IVH) occurs when bleeding happens inside the brain\'s ventricular system, which consists of fluid-filled spaces that produce and circulate cerebrospinal fluid. This type of bleeding is often caused by conditions like aneurysms, arteriovenous malformations (AVMs), or head trauma. The blood can block the flow of cerebrospinal fluid, leading to increased pressure inside the skull and potential brain damage. IVH is a serious condition that requires urgent medical attention.',
      name: 'intraventricularDescription',
      desc: '',
      args: [],
    );
  }

  /// `The bleeding occurs inside the brain's ventricular system, including the lateral, third, and fourth ventricles.`
  String get intraventricularLocation {
    return Intl.message(
      'The bleeding occurs inside the brain\'s ventricular system, including the lateral, third, and fourth ventricles.',
      name: 'intraventricularLocation',
      desc: '',
      args: [],
    );
  }

  /// `Rupture of an aneurysm.`
  String get intraventricularCause1 {
    return Intl.message(
      'Rupture of an aneurysm.',
      name: 'intraventricularCause1',
      desc: '',
      args: [],
    );
  }

  /// `Arteriovenous malformation (AVM).`
  String get intraventricularCause2 {
    return Intl.message(
      'Arteriovenous malformation (AVM).',
      name: 'intraventricularCause2',
      desc: '',
      args: [],
    );
  }

  /// `Head trauma.`
  String get intraventricularCause3 {
    return Intl.message(
      'Head trauma.',
      name: 'intraventricularCause3',
      desc: '',
      args: [],
    );
  }

  /// `Uncontrolled high blood pressure.`
  String get intraventricularCause4 {
    return Intl.message(
      'Uncontrolled high blood pressure.',
      name: 'intraventricularCause4',
      desc: '',
      args: [],
    );
  }

  /// `Blood clotting disorders.`
  String get intraventricularCause5 {
    return Intl.message(
      'Blood clotting disorders.',
      name: 'intraventricularCause5',
      desc: '',
      args: [],
    );
  }

  /// `Blood accumulates inside the brain's ventricles.`
  String get intraventricularCharacteristic1 {
    return Intl.message(
      'Blood accumulates inside the brain\'s ventricles.',
      name: 'intraventricularCharacteristic1',
      desc: '',
      args: [],
    );
  }

  /// `It can cause the ventricles to expand and increase intracranial pressure.`
  String get intraventricularCharacteristic2 {
    return Intl.message(
      'It can cause the ventricles to expand and increase intracranial pressure.',
      name: 'intraventricularCharacteristic2',
      desc: '',
      args: [],
    );
  }

  /// `Classified into grades I to IV based on the extent of bleeding and ventricular enlargement.`
  String get intraventricularCharacteristic3 {
    return Intl.message(
      'Classified into grades I to IV based on the extent of bleeding and ventricular enlargement.',
      name: 'intraventricularCharacteristic3',
      desc: '',
      args: [],
    );
  }

  /// `Sudden headache.`
  String get intraventricularSymptom1 {
    return Intl.message(
      'Sudden headache.',
      name: 'intraventricularSymptom1',
      desc: '',
      args: [],
    );
  }

  /// `Nausea and vomiting.`
  String get intraventricularSymptom2 {
    return Intl.message(
      'Nausea and vomiting.',
      name: 'intraventricularSymptom2',
      desc: '',
      args: [],
    );
  }

  /// `Neurological deficits, such as weakness or difficulty speaking.`
  String get intraventricularSymptom3 {
    return Intl.message(
      'Neurological deficits, such as weakness or difficulty speaking.',
      name: 'intraventricularSymptom3',
      desc: '',
      args: [],
    );
  }

  /// `Changes in consciousness.`
  String get intraventricularSymptom4 {
    return Intl.message(
      'Changes in consciousness.',
      name: 'intraventricularSymptom4',
      desc: '',
      args: [],
    );
  }

  /// `Seizures.`
  String get intraventricularSymptom5 {
    return Intl.message(
      'Seizures.',
      name: 'intraventricularSymptom5',
      desc: '',
      args: [],
    );
  }

  /// `Intraparenchymal Hemorrhage`
  String get intraparenchymalHemorrhage {
    return Intl.message(
      'Intraparenchymal Hemorrhage',
      name: 'intraparenchymalHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `What is an Intraparenchymal Hemorrhage?`
  String get whatIsIntraparenchymalHemorrhage {
    return Intl.message(
      'What is an Intraparenchymal Hemorrhage?',
      name: 'whatIsIntraparenchymalHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `An intraparenchymal hemorrhage (IPH) occurs when bleeding happens within the brain tissue itself, usually due to the rupture of small blood vessels. This type of bleeding is often caused by high blood pressure, which weakens the blood vessel walls over time. Other causes include cerebral amyloid angiopathy (a condition where protein builds up in blood vessels, common in older adults) or vascular abnormalities like AVMs. The pooled blood can damage surrounding brain tissue and cause symptoms such as sudden severe headache, weakness, or difficulty speaking. IPH is a serious condition that requires immediate medical care.`
  String get intraparenchymalDescription {
    return Intl.message(
      'An intraparenchymal hemorrhage (IPH) occurs when bleeding happens within the brain tissue itself, usually due to the rupture of small blood vessels. This type of bleeding is often caused by high blood pressure, which weakens the blood vessel walls over time. Other causes include cerebral amyloid angiopathy (a condition where protein builds up in blood vessels, common in older adults) or vascular abnormalities like AVMs. The pooled blood can damage surrounding brain tissue and cause symptoms such as sudden severe headache, weakness, or difficulty speaking. IPH is a serious condition that requires immediate medical care.',
      name: 'intraparenchymalDescription',
      desc: '',
      args: [],
    );
  }

  /// `The bleeding occurs within the brain tissue, usually in the white matter.`
  String get intraparenchymalLocation {
    return Intl.message(
      'The bleeding occurs within the brain tissue, usually in the white matter.',
      name: 'intraparenchymalLocation',
      desc: '',
      args: [],
    );
  }

  /// `High blood pressure causing small blood vessels to rupture.`
  String get intraparenchymalCause1 {
    return Intl.message(
      'High blood pressure causing small blood vessels to rupture.',
      name: 'intraparenchymalCause1',
      desc: '',
      args: [],
    );
  }

  /// `Cerebral amyloid angiopathy (CAA), a condition common in older adults where protein builds up in blood vessels.`
  String get intraparenchymalCause2 {
    return Intl.message(
      'Cerebral amyloid angiopathy (CAA), a condition common in older adults where protein builds up in blood vessels.',
      name: 'intraparenchymalCause2',
      desc: '',
      args: [],
    );
  }

  /// `Vascular abnormalities like arteriovenous malformations (AVMs) or aneurysms.`
  String get intraparenchymalCause3 {
    return Intl.message(
      'Vascular abnormalities like arteriovenous malformations (AVMs) or aneurysms.',
      name: 'intraparenchymalCause3',
      desc: '',
      args: [],
    );
  }

  /// `Blood is seen within the brain tissue on imaging scans like CT or MRI.`
  String get intraparenchymalCharacteristic1 {
    return Intl.message(
      'Blood is seen within the brain tissue on imaging scans like CT or MRI.',
      name: 'intraparenchymalCharacteristic1',
      desc: '',
      args: [],
    );
  }

  /// `It can cause damage to the surrounding brain tissue.`
  String get intraparenchymalCharacteristic2 {
    return Intl.message(
      'It can cause damage to the surrounding brain tissue.',
      name: 'intraparenchymalCharacteristic2',
      desc: '',
      args: [],
    );
  }

  /// `Sudden, severe headache, often described as the worst headache ever experienced.`
  String get intraparenchymalSymptom1 {
    return Intl.message(
      'Sudden, severe headache, often described as the worst headache ever experienced.',
      name: 'intraparenchymalSymptom1',
      desc: '',
      args: [],
    );
  }

  /// `Nausea and vomiting.`
  String get intraparenchymalSymptom2 {
    return Intl.message(
      'Nausea and vomiting.',
      name: 'intraparenchymalSymptom2',
      desc: '',
      args: [],
    );
  }

  /// `Neurological deficits, such as weakness, numbness, or difficulty speaking.`
  String get intraparenchymalSymptom3 {
    return Intl.message(
      'Neurological deficits, such as weakness, numbness, or difficulty speaking.',
      name: 'intraparenchymalSymptom3',
      desc: '',
      args: [],
    );
  }

  /// `Loss of consciousness in severe cases.`
  String get intraparenchymalSymptom4 {
    return Intl.message(
      'Loss of consciousness in severe cases.',
      name: 'intraparenchymalSymptom4',
      desc: '',
      args: [],
    );
  }

  /// `Epidural Hemorrhage`
  String get epiduralHemorrhage {
    return Intl.message(
      'Epidural Hemorrhage',
      name: 'epiduralHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `What is an Epidural Hemorrhage?`
  String get whatIsEpiduralHemorrhage {
    return Intl.message(
      'What is an Epidural Hemorrhage?',
      name: 'whatIsEpiduralHemorrhage',
      desc: '',
      args: [],
    );
  }

  /// `An epidural hemorrhage (EDH) occurs when blood collects between the dura mater (the outermost protective layer of the brain) and the skull. This condition is usually caused by a head injury, such as a car accident or a fall, which tears the middle meningeal artery. The pooled blood can press on the brain and cause symptoms like severe headache, nausea, vomiting, and loss of consciousness. Epidural hemorrhage is a medical emergency that requires immediate treatment to prevent life-threatening complications.`
  String get epiduralDescription {
    return Intl.message(
      'An epidural hemorrhage (EDH) occurs when blood collects between the dura mater (the outermost protective layer of the brain) and the skull. This condition is usually caused by a head injury, such as a car accident or a fall, which tears the middle meningeal artery. The pooled blood can press on the brain and cause symptoms like severe headache, nausea, vomiting, and loss of consciousness. Epidural hemorrhage is a medical emergency that requires immediate treatment to prevent life-threatening complications.',
      name: 'epiduralDescription',
      desc: '',
      args: [],
    );
  }

  /// `The bleeding occurs between the dura mater and the skull.`
  String get epiduralLocation {
    return Intl.message(
      'The bleeding occurs between the dura mater and the skull.',
      name: 'epiduralLocation',
      desc: '',
      args: [],
    );
  }

  /// `Head trauma, such as car accidents or falls, which tears the middle meningeal artery.`
  String get epiduralCause1 {
    return Intl.message(
      'Head trauma, such as car accidents or falls, which tears the middle meningeal artery.',
      name: 'epiduralCause1',
      desc: '',
      args: [],
    );
  }

  /// `In rare cases, it can occur spontaneously in individuals with certain vascular conditions.`
  String get epiduralCause2 {
    return Intl.message(
      'In rare cases, it can occur spontaneously in individuals with certain vascular conditions.',
      name: 'epiduralCause2',
      desc: '',
      args: [],
    );
  }

  /// `Blood collects between the dura mater and the skull.`
  String get epiduralCharacteristic1 {
    return Intl.message(
      'Blood collects between the dura mater and the skull.',
      name: 'epiduralCharacteristic1',
      desc: '',
      args: [],
    );
  }

  /// `It is usually caused by a tear in the middle meningeal artery.`
  String get epiduralCharacteristic2 {
    return Intl.message(
      'It is usually caused by a tear in the middle meningeal artery.',
      name: 'epiduralCharacteristic2',
      desc: '',
      args: [],
    );
  }

  /// `Severe headache.`
  String get epiduralSymptom1 {
    return Intl.message(
      'Severe headache.',
      name: 'epiduralSymptom1',
      desc: '',
      args: [],
    );
  }

  /// `Nausea and vomiting.`
  String get epiduralSymptom2 {
    return Intl.message(
      'Nausea and vomiting.',
      name: 'epiduralSymptom2',
      desc: '',
      args: [],
    );
  }

  /// `Loss of consciousness.`
  String get epiduralSymptom3 {
    return Intl.message(
      'Loss of consciousness.',
      name: 'epiduralSymptom3',
      desc: '',
      args: [],
    );
  }

  /// `Stiff neck.`
  String get epiduralSymptom4 {
    return Intl.message(
      'Stiff neck.',
      name: 'epiduralSymptom4',
      desc: '',
      args: [],
    );
  }

  /// `Changes in mental status, such as confusion or decreased alertness.`
  String get epiduralSymptom5 {
    return Intl.message(
      'Changes in mental status, such as confusion or decreased alertness.',
      name: 'epiduralSymptom5',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'id'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
