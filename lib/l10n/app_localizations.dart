import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ich_web/generated/intl/messages_all.dart'; 

class AppLocalizationss {
  static Future<AppLocalizationss> load(Locale locale) {
    final String name = locale.countryCode?.isEmpty ?? true ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizationss();
    });
  }

  static AppLocalizationss of(BuildContext context) {
    return Localizations.of<AppLocalizationss>(context, AppLocalizationss)!;
  }

  // Helper method untuk menghindari pengulangan Intl.message
  String translate(String key) => Intl.message(key, name: key);

  // App Title
  String get appTitle => Intl.message('Intracranial Hemorrhage Classification', name: 'appTitle');

  // Home Page
  String get whatIsICH => Intl.message('What is Intracranial Hemorrhage?', name: 'whatIsICH');
  String get ichDescription => Intl.message('Intracranial hemorrhage (ICH) is a general term for bleeding inside the skull. It encompasses all types of brain bleeds, including subdural, intraparenchymal, intraventricular, subarachnoid, and epidural hemorrhages. ICH is commonly caused by trauma, high blood pressure, blood vessel abnormalities, or aneurysms. The symptoms of ICH vary depending on the location and severity of the bleed, and can range from headaches and dizziness to loss of consciousness or death. Prompt medical attention is required to manage ICH, and the treatment approach depends on the cause, type, and severity of the hemorrhage.',name: 'ichDescription');
  String get typesOfICH => Intl.message('Types of Intracranial Hemorrhage', name: 'typesOfICH');
  String get startClassification => Intl.message('Start Classification', name: 'startClassification');
  String get uploadDicomFile => Intl.message('Upload DICOM File', name: 'uploadDicomFile');
  String get language=> Intl.message('Language', name: 'language');
  String get gotoichclass=> Intl.message('Go to ICH Classification', name: 'gotoichclass');
  String get chooseLanguage=> Intl.message('Choose Language', name: 'chooseLanguage');

  // Classification Page
  String get heatmapDetection => Intl.message('HeatMap Detection', name: 'heatmapDetection');
  String get processedImage => Intl.message('Processed Image', name: 'processedImage');
  String get classificationResult => Intl.message('Classification Result', name: 'classificationResult');
  String get noHeatmapGeneratedYet => Intl.message('No heatmap generated yet', name: 'noHeatmapGeneratedYet');
  String get noProcessedImageAvailable => Intl.message('No processed image available', name: 'noProcessedImageAvailable');
  String get noClassificationResultAvailable => Intl.message('No Classification result available', name: 'noClassificationResultAvailable');
  String get backToHome => Intl.message('Back to Home', name: 'backToHome');
  String get previousImage=> Intl.message('Previous Image', name: 'previousImage');
  String get nextImage=> Intl.message('Next Image', name: 'nextImage');

  // Education Page
  String get location=> Intl.message('Location', name: 'location');
  String get causes=> Intl.message('Causes', name: 'causes');
  String get characteristics=> Intl.message('Characteristics', name: 'characteristics');
  String get symptoms=> Intl.message('Symptoms', name: 'symptoms');
  String get exampleOfSubduralHemorrhage=> Intl.message('Example Of Subdural Hemorrhage', name: 'exampleOfSubduralHemorrhage');
  String get exampleOfSubarachnoidHemorrhage=> Intl.message('Example Of Subdural Hemorrhage', name: 'exampleOfSubarachnoidHemorrhage');
  String get exampleOfIntraventricularHemorrhage=> Intl.message('Example of Intraventricular Hemorrhage', name: 'exampleOfIntraventricularHemorrhage');
  String get exampleOfIntraparenchymalHemorrhage=> Intl.message('Example of Intraparenchymal Hemorrhage', name: 'exampleOfIntraparenchymalHemorrhage');
  String get exampleOfEpiduralHemorrhage=> Intl.message('Example of Epidural Hemorrhage', name: 'exampleOfEpiduralHemorrhage');

  // Subdural Hemorrhage Page
  String get subduralHemorrhage => Intl.message('Subdural Hemorrhage', name: 'subduralHemorrhage');
  String get whatIsSubduralHemorrhage => Intl.message('What is Subdural Hemorrhage?', name: 'whatIsSubduralHemorrhage');
  String get subduralDescription => Intl.message('Subdural hemorrhage (SDH) refers to a collection of blood between the dura mater (the outer protective layer of the brain) and the arachnoid layer. It is commonly caused by trauma to the head, leading to the rupture of blood vessels.', name: 'subduralDescription');
  String get subduralLocation => Intl.message('Bleeding occurs between the dura mater (the outermost meningeal layer) and the arachnoid mater.', name: 'subduralLocation');
  String get subduralCause1 => Intl.message('Traumatic brain injury (e.g., falls, motor vehicle accidents) leading to tearing of bridging veins.', name: 'subduralCause1');
  String get subduralCause2 => Intl.message('In older adults or alcoholics, minor trauma can cause SDH due to brain atrophy, which stretches the veins.', name: 'subduralCause2');
  String get subduralCharacteristic1 => Intl.message('Blood spreads along the brain surface and follows the contours of the brain (crescent-shaped on imaging).', name: 'subduralCharacteristic1');
  String get subduralCharacteristic2 => Intl.message('It can be acute (sudden), subacute, or chronic (developing over weeks to months).', name: 'subduralCharacteristic2');
  String get subduralSymptom1 => Intl.message('Acute SDH: Rapid onset of headache, altered consciousness, and focal neurological deficits.', name: 'subduralSymptom1');
  String get subduralSymptom2 => Intl.message('Chronic SDH: Gradual headache, confusion, memory problems, or weakness.', name: 'subduralSymptom2');

  String get subarachnoidHemorrhage => Intl.message('Subarachnoid Hemorrhage', name: 'subarachnoidHemorrhage');
  String get whatIsSubarachnoidHemorrhage => Intl.message('What is Subarachnoid Hemorrhage?', name: 'whatIsSubarachnoidHemorrhage');
  String get subarachnoidDescription => Intl.message('Subarachnoid hemorrhage (SAH) refers to bleeding into the subarachnoid space, the area between the arachnoid mater and the pia mater. It is commonly caused by the rupture of an aneurysm or arteriovenous malformation (AVM).', name: 'subarachnoidDescription');
  String get subarachnoidLocation => Intl.message('Bleeding occurs in the subarachnoid space, the area between the arachnoid mater and the pia mater.', name: 'subarachnoidLocation');
  String get subarachnoidCause1 => Intl.message('Rupture of an aneurysm.', name: 'subarachnoidCause1');
  String get subarachnoidCause2 => Intl.message('Rupture of an arteriovenous malformation (AVM).', name: 'subarachnoidCause2');
  String get subarachnoidCharacteristic1 => Intl.message('Blood is found in the subarachnoid space.', name: 'subarachnoidCharacteristic1');
  String get subarachnoidCharacteristic2 => Intl.message('Can cause sudden and severe headache ("thunderclap headache").', name: 'subarachnoidCharacteristic2');
  String get subarachnoidSymptom1 => Intl.message('Severe headache, often described as the "worst headache of life".', name: 'subarachnoidSymptom1');
  String get subarachnoidSymptom2 => Intl.message('Nausea and vomiting.', name: 'subarachnoidSymptom2');
  String get subarachnoidSymptom3 => Intl.message('Stiff neck (nuchal rigidity).', name: 'subarachnoidSymptom3');
  String get subarachnoidSymptom4 => Intl.message('Altered mental status or loss of consciousness.', name: 'subarachnoidSymptom4');

  String get intraventricularHemorrhage => Intl.message('Intraventricular Hemorrhage', name: 'intraventricularHemorrhage');
  String get whatIsIntraventricularHemorrhage => Intl.message('What is Intraventricular Hemorrhage?', name: 'whatIsIntraventricularHemorrhage');
  String get intraventricularDescription => Intl.message('Intraventricular hemorrhage (IVH) refers to bleeding that occurs within the ventricular system of the brain. It is commonly associated with conditions such as aneurysms, arteriovenous malformations (AVMs), and head trauma.', name: 'intraventricularDescription');
  String get intraventricularLocation => Intl.message('Bleeding occurs within the ventricular system of the brain, including the lateral ventricles, third ventricle, and fourth ventricle.', name: 'intraventricularLocation');
  String get intraventricularCause1 => Intl.message('Aneurysms.', name: 'intraventricularCause1');
  String get intraventricularCause2 => Intl.message('Arteriovenous malformations (AVMs).', name: 'intraventricularCause2');
  String get intraventricularCause3 => Intl.message('Head trauma.', name: 'intraventricularCause3');
  String get intraventricularCause4 => Intl.message('Hypertension.', name: 'intraventricularCause4');
  String get intraventricularCause5 => Intl.message('Coagulopathy.', name: 'intraventricularCause5');
  String get intraventricularCharacteristic1 => Intl.message('Blood accumulates within the ventricular system.', name: 'intraventricularCharacteristic1');
  String get intraventricularCharacteristic2 => Intl.message('Can cause ventricular enlargement and increased intracranial pressure.', name: 'intraventricularCharacteristic2');
  String get intraventricularCharacteristic3 => Intl.message('Classified into grades I to IV based on the extent of bleeding and ventricular enlargement.', name: 'intraventricularCharacteristic3');
  String get intraventricularSymptom1 => Intl.message('Sudden headache.', name: 'intraventricularSymptom1');
  String get intraventricularSymptom2 => Intl.message('Nausea and vomiting.', name: 'intraventricularSymptom2');
  String get intraventricularSymptom3 => Intl.message('Neurological deficits.', name: 'intraventricularSymptom3');
  String get intraventricularSymptom4 => Intl.message('Altered consciousness.', name: 'intraventricularSymptom4');
  String get intraventricularSymptom5 => Intl.message('Seizures.', name: 'intraventricularSymptom5');

  String get intraparenchymalHemorrhage => Intl.message('Intraparenchymal Hemorrhage', name: 'intraparenchymalHemorrhage');
  String get whatIsIntraparenchymalHemorrhage => Intl.message('What is Intraparenchymal Hemorrhage?', name: 'whatIsIntraparenchymalHemorrhage');
  String get intraparenchymalDescription => Intl.message('Intraparenchymal hemorrhage (IPH) refers to bleeding that occurs within the brain tissue itself. It is typically caused by the rupture of small blood vessels within the brain parenchyma.', name: 'intraparenchymalDescription');
  String get intraparenchymalLocation => Intl.message('Bleeding occurs within the brain tissue itself, typically in the white matter.', name: 'intraparenchymalLocation');
  String get intraparenchymalCause1 => Intl.message('Hypertension leading to the rupture of small blood vessels.', name: 'intraparenchymalCause1');
  String get intraparenchymalCause2 => Intl.message('Cerebral amyloid angiography (CAA) in older adults.', name: 'intraparenchymalCause2');
  String get intraparenchymalCause3 => Intl.message('Other conditions such as arteriovenous malformations (AVMs) or aneurysms.', name: 'intraparenchymalCause3');
  String get intraparenchymalCharacteristic1 => Intl.message('Blood is located within the brain parenchyma.', name: 'intraparenchymalCharacteristic1');
  String get intraparenchymalCharacteristic2 => Intl.message('Can be detected on imaging studies such as CT scans or MRI.', name: 'intraparenchymalCharacteristic2');
  String get intraparenchymalSymptom1 => Intl.message('Sudden headache, often described as the \"worst headache of life\".', name: 'intraparenchymalSymptom1');
  String get intraparenchymalSymptom2 => Intl.message('Nausea and vomiting.', name: 'intraparenchymalSymptom2');
  String get intraparenchymalSymptom3 => Intl.message('Neurological deficits such as weakness, numbness, or speech difficulties.', name: 'intraparenchymalSymptom3');
  String get intraparenchymalSymptom4 => Intl.message('Loss of consciousness in severe cases.', name: 'intraparenchymalSymptom4');

  String get epiduralHemorrhage => Intl.message('Epidural Hemorrhage', name: 'epiduralHemorrhage');
  String get whatIsEpiduralHemorrhage => Intl.message('What is Epidural Hemorrhage?', name: 'whatIsEpiduralHemorrhage');
  String get epiduralDescription => Intl.message('Epidural hemorrhage (EDH) refers to a collection of blood between the dura mater (the outermost membrane of the brain) and the skull. It is typically caused by a tear in the middle meningeal artery, often due to a traumatic head injury.', name: 'epiduralDescription');
  String get epiduralLocation => Intl.message('Bleeding occurs between the dura mater and the skull.', name: 'epiduralLocation');
  String get epiduralCause1 => Intl.message('Traumatic brain injury (e.g., motor vehicle accidents, falls) leading to tearing of the middle meningeal artery.', name: 'epiduralCause1');
  String get epiduralCause2 => Intl.message('Rarely, it can occur spontaneously in individuals with certain vascular conditions.', name: 'epiduralCause2');
  String get epiduralCharacteristic1 => Intl.message('Blood collects between the dura mater and the skull.', name: 'epiduralCharacteristic1');
  String get epiduralCharacteristic2 => Intl.message('It is usually a result of a tear in the middle meningeal artery.', name: 'epiduralCharacteristic2');
  String get epiduralSymptom1 => Intl.message('Severe headache.', name: 'epiduralSymptom1');
  String get epiduralSymptom2 => Intl.message('Nausea and vomiting.', name: 'epiduralSymptom2');
  String get epiduralSymptom3 => Intl.message('Loss of consciousness.', name: 'epiduralSymptom3');
  String get epiduralSymptom4 => Intl.message('Stiff neck.', name: 'epiduralSymptom4');
  String get epiduralSymptom5 => Intl.message('Altered mental status', name: 'epiduralSymptom5');


  // Upload Page
  String get importantDiagnosticDisclaimer=> Intl.message('Important Diagnostic Disclaimer', name: 'importantDiagnosticDisclaimer');
  String get uploadAndClassificationDescription=> Intl.message('Upload a DICOM file to start the classification process.', name: 'uploadAndClassificationDescription');
  String get selectDicomFile=> Intl.message('Select DICOM File from Device', name: 'selectDicomFile');
  String get fileSelected=> Intl.message('File Selected:', name: 'fileSelected');
  String get uploadAndClassify=> Intl.message('Upload And Classify', name: 'uploadAndClassify');
  String get removeFile=> Intl.message('Remove File', name: 'removeFile');
  String get selectExampleDicomFile=> Intl.message('Select Example Dicom File', name: 'selectExampleDicomFile');
  String get noImagesAvailable=> Intl.message('No images available.', name: 'noImagesAvailable');
  String get prediction=> Intl.message('Prediction: ', name: 'prediction');
  String get positive=> Intl.message('Positive', name: 'positive');
  String get negative=> Intl.message('Negative', name: 'negative');
  String get predictionDetails=> Intl.message('Prediction Details:', name: 'predictionDetails');
  String get classificationResultWillDisplayHere=> Intl.message('Classification result will display here.', name: 'classificationResultWillDisplayHere');
  String get noHeatmapDataAvailable=> Intl.message('No heatmap data available.', name: 'noHeatmapDataAvailable');
  String get label=> Intl.message('Label: ', name: 'label');
  String get confidence=> Intl.message('Confidence: ', name: 'confidence');
}

class AppLocalizationssDelegate extends LocalizationsDelegate<AppLocalizationss> {
  const AppLocalizationssDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'id'].contains(locale.languageCode);

  @override
  Future<AppLocalizationss> load(Locale locale) => AppLocalizationss.load(locale);

  @override
  bool shouldReload(AppLocalizationssDelegate old) => false;
}