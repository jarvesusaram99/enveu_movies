import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'hi_IN': {
          'Popular': 'लोकप्रिय फिल्में',
          'Movie': 'फिल्में',
          'SuperNatural': 'अलौकिक टीवी शो',
          'Dummy': 'डमी एपीआई डेटा',
          'More': 'और देखें',
        },
        'en_US': {
          'Popular': 'Popular Movies',
          'Movie': 'Movies',
          'SuperNatural': 'Supernatural TV Shows',
          'Dummy': 'Dummy API  Data',
          'More': 'More',
        },
      };
}
