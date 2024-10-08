class User{
  var _name;
  var _email;
  var _password;
  var _genre;
  var _isActionFavorite;
  var _isAdventureFavorite;
  var _isComicFavorite;
  var _isTerrorFavorite;
  var _isRomanceFavorite;
  var _isFantacyFavorite;
  var _bornDate;
  var _city;

  User.Empty();

  Map<String, dynamic> toJson() =>{
    "name": _name,
    "email": _email,
    "password": _password,
    "genre": _genre,
    "isActionFavorite": _isActionFavorite,
    "isAdventureFavorite": _isAdventureFavorite,
    "isComicFavorite": _isComicFavorite,
    "isTerrorFavorite": _isTerrorFavorite,
    "isRomanceFavorite": _isRomanceFavorite,
    "isFantacyFavorite": _isFantacyFavorite,
    "bornDate": _bornDate,
    "city": _city
  };
  User.fromJson( Map<String, dynamic> json){
    _name = json["name"];
    _email = json["email"];
    _password = json["password"];
    _genre = json["genre"];
    _isActionFavorite = json["isActionFavorite"];
    _isAdventureFavorite = json["isAdventureFavorite"];
    _isComicFavorite = json["isComicFavorite"];
    _isTerrorFavorite = json["isTerrorFavorite"];
    _isRomanceFavorite = json["isRomanceFavorite"];
    _isFantacyFavorite = json["isFantacyFavorite"];
    _bornDate = json["bornDate"];
    _city = json["city"];

  }
  get name => _name;

  set name(value) {
    _name = value;
  }

  get email => _email;

  get bornDate => _bornDate;

  set bornDate(value) {
    _bornDate = value;
  }

  get isFantacyFavorite => _isFantacyFavorite;

  set isFantacyFavorite(value) {
    _isFantacyFavorite = value;
  }

  get isRomanceFavorite => _isRomanceFavorite;

  set isRomanceFavorite(value) {
    _isRomanceFavorite = value;
  }

  get isTerrorFavorite => _isTerrorFavorite;

  set isTerrorFavorite(value) {
    _isTerrorFavorite = value;
  }

  get isComicFavorite => _isComicFavorite;

  set isComicFavorite(value) {
    _isComicFavorite = value;
  }

  get isAdventureFavorite => _isAdventureFavorite;

  set isAdventureFavorite(value) {
    _isAdventureFavorite = value;
  }

  get isActionFavorite => _isActionFavorite;

  set isActionFavorite(value) {
    _isActionFavorite = value;
  }

  get genre => _genre;

  set genre(value) {
    _genre = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  set email(value) {
    _email = value;
  }

  get city => _city;

  set city(value) {
    _city = value;
  }

  User(
      this._name,
      this._email,
      this._password,
      this._genre,
      this._isActionFavorite,
      this._isAdventureFavorite,
      this._isComicFavorite,
      this._isTerrorFavorite,
      this._isRomanceFavorite,
      this._isFantacyFavorite,
      this._bornDate,
      this._city);


}