class Job {
  final String company;
  final String logoUrl;
  bool isMark;
  final String title;
  final String location;
  final String time;
  final List<String> req;
  Job(this.company, this.logoUrl, this.isMark, this.title, this.location,
      this.time, this.req);
  static List<Job> generateJobs() {
    return [
      Job(
        'TALAMANZOU | تالامانزو',
        'assets/icons/danger.png',
        false,
        'Principal Product Design',
        '#123 Ahl Tifnoute , Region',
        'Full Time',
        [
          'Évaluation rapide des besoins : Envoyez des équipes d\'évaluation sur le terrain pour identifier les besoins les plus urgents des victimes.'
          'Fourniture de soins médicaux d\'urgence : Mettez en place des hôpitaux de campagne pour traiter les blessés et fournir des médicaments essentiels.'
          'Distribution de nourriture et d\'eau potable : Assurez-vous que les familles ont accès à des aliments de base et à de l\'eau propre pour éviter la déshydratation et la malnutrition.'
        ],
      ),
      Job(
        'TISSAKHTE | تيساخت',
        'assets/icons/warning.png',
        false,
        'Principal Product Design',
        '#134 Ouneine , Region',
        'Full Time',
        [
          'Évaluation rapide des besoins : Envoyez des équipes d\'évaluation sur le terrain pour identifier les besoins les plus urgents des victimes.'
              'Fourniture de soins médicaux d\'urgence : Mettez en place des hôpitaux de campagne pour traiter les blessés et fournir des médicaments essentiels.'
              'Distribution de nourriture et d\'eau potable : Assurez-vous que les familles ont accès à des aliments de base et à de l\'eau propre pour éviter la déshydratation et la malnutrition.'
        ],
      ),
      Job(
        'LAMRAMDA ZAOUIAT | لمرمادا الزاوية',
        'assets/icons/mark.png',
        false,
        'Principal Product Design',
        '#154 El Faid , Region',
        'Full Time',
        [
          'Évaluation rapide des besoins : Envoyez des équipes d\'évaluation sur le terrain pour identifier les besoins les plus urgents des victimes.'
              'Fourniture de soins médicaux d\'urgence : Mettez en place des hôpitaux de campagne pour traiter les blessés et fournir des médicaments essentiels.'
              'Distribution de nourriture et d\'eau potable : Assurez-vous que les familles ont accès à des aliments de base et à de l\'eau propre pour éviter la déshydratation et la malnutrition.'
        ],
      ),
    ];
  }
}