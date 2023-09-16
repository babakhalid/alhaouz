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
        'Google LLC',
        'Douar #1',
        false,
        'Association #1',
        'douar lmessarih jama3at ichamrarne chichaoua	',
        '14/09/2023',
        [
          'Évaluation rapide des besoins : Envoyez des équipes d\'évaluation sur le terrain pour identifier les besoins les plus urgents des victimes.',
              'Fourniture de soins médicaux d\'urgence : Mettez en place des hôpitaux de campagne pour traiter les blessés et fournir des médicaments essentiels.',
              'Distribution de nourriture et d\'eau potable : Assurez-vous que les familles ont accès à des aliments de base et à de l\'eau propre pour éviter la déshydratation et la malnutrition.',
        ],
      ),
      Job(
        'Airbnb Inc',
        'Douar #2',
        false,
        'Association #2',
        'douar lmessarih jama3at ichamrarne chichaoua	',
        '14/09/2023',
        [
          'Évaluation rapide des besoins : Envoyez des équipes d\'évaluation sur le terrain pour identifier les besoins les plus urgents des victimes.',
          'Fourniture de soins médicaux d\'urgence : Mettez en place des hôpitaux de campagne pour traiter les blessés et fournir des médicaments essentiels.',
          'Distribution de nourriture et d\'eau potable : Assurez-vous que les familles ont accès à des aliments de base et à de l\'eau propre pour éviter la déshydratation et la malnutrition.',
        ],
      ),
      Job(
        'Linkedin',
        'Douar #3',
        false,
        'Association #3',
        'douar lmessarih jama3at ichamrarne chichaoua	',
        '14/09/2023',
        [
          'Évaluation rapide des besoins : Envoyez des équipes d\'évaluation sur le terrain pour identifier les besoins les plus urgents des victimes.',
          'Fourniture de soins médicaux d\'urgence : Mettez en place des hôpitaux de campagne pour traiter les blessés et fournir des médicaments essentiels.',
          'Distribution de nourriture et d\'eau potable : Assurez-vous que les familles ont accès à des aliments de base et à de l\'eau propre pour éviter la déshydratation et la malnutrition.',
        ],
      ),
    ];
  }
}