class Company {
  String _website;
  String _name;
  String _logoURL;
  int _companyId;
  String _description;

  String get website => _website;
  String get name => _name;
  String get logoURL => _logoURL;
  int get companyId => _companyId;
  String get description => _description;

  Company(
    this._website,
    this._name,
    this._logoURL,
    this._companyId,
    this._description,
  );
}
