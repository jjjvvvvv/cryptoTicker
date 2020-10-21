class tickerData {
  double _ask;
  double _bid;
  double _last;
  double _high;
  double _low;
  Open _open;
  Averages _averages;
  double _volume;
  Changes _changes;
  double _volumePercent;
  int _timestamp;
  String _displayTimestamp;

  tickerData(
      {double ask,
      double bid,
      double last,
      double high,
      double low,
      Open open,
      Averages averages,
      double volume,
      Changes changes,
      double volumePercent,
      int timestamp,
      String displayTimestamp}) {
    this._ask = ask;
    this._bid = bid;
    this._last = last;
    this._high = high;
    this._low = low;
    this._open = open;
    this._averages = averages;
    this._volume = volume;
    this._changes = changes;
    this._volumePercent = volumePercent;
    this._timestamp = timestamp;
    this._displayTimestamp = displayTimestamp;
  }

  double get ask => _ask;
  set ask(double ask) => _ask = ask;
  double get bid => _bid;
  set bid(double bid) => _bid = bid;
  double get last => _last;
  set last(double last) => _last = last;
  double get high => _high;
  set high(double high) => _high = high;
  double get low => _low;
  set low(double low) => _low = low;
  Open get open => _open;
  set open(Open open) => _open = open;
  Averages get averages => _averages;
  set averages(Averages averages) => _averages = averages;
  double get volume => _volume;
  set volume(double volume) => _volume = volume;
  Changes get changes => _changes;
  set changes(Changes changes) => _changes = changes;
  double get volumePercent => _volumePercent;
  set volumePercent(double volumePercent) => _volumePercent = volumePercent;
  int get timestamp => _timestamp;
  set timestamp(int timestamp) => _timestamp = timestamp;
  String get displayTimestamp => _displayTimestamp;
  set displayTimestamp(String displayTimestamp) =>
      _displayTimestamp = displayTimestamp;

  tickerData.fromJson(Map<String, dynamic> json) {
    _ask = json['ask'];
    _bid = json['bid'];
    _last = json['last'];
    _high = json['high'];
    _low = json['low'];
    _open = json['open'] != null ? new Open.fromJson(json['open']) : null;
    _averages = json['averages'] != null
        ? new Averages.fromJson(json['averages'])
        : null;
    _volume = json['volume'];
    _changes =
        json['changes'] != null ? new Changes.fromJson(json['changes']) : null;
    _volumePercent = json['volume_percent'];
    _timestamp = json['timestamp'];
    _displayTimestamp = json['display_timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ask'] = this._ask;
    data['bid'] = this._bid;
    data['last'] = this._last;
    data['high'] = this._high;
    data['low'] = this._low;
    if (this._open != null) {
      data['open'] = this._open.toJson();
    }
    if (this._averages != null) {
      data['averages'] = this._averages.toJson();
    }
    data['volume'] = this._volume;
    if (this._changes != null) {
      data['changes'] = this._changes.toJson();
    }
    data['volume_percent'] = this._volumePercent;
    data['timestamp'] = this._timestamp;
    data['display_timestamp'] = this._displayTimestamp;
    return data;
  }
}

class Open {
  String _day;
  String _week;
  String _month;

  Open({String day, String week, String month}) {
    this._day = day;
    this._week = week;
    this._month = month;
  }

  String get day => _day;
  set day(String day) => _day = day;
  String get week => _week;
  set week(String week) => _week = week;
  String get month => _month;
  set month(String month) => _month = month;

  Open.fromJson(Map<String, dynamic> json) {
    _day = json['day'];
    _week = json['week'];
    _month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this._day;
    data['week'] = this._week;
    data['month'] = this._month;
    return data;
  }
}

class Averages {
  double _daily;
  double _weekly;
  double _monthly;

  Averages({double daily, double weekly, double monthly}) {
    this._daily = daily;
    this._weekly = weekly;
    this._monthly = monthly;
  }

  double get daily => _daily;
  set daily(double daily) => _daily = daily;
  double get weekly => _weekly;
  set weekly(double weekly) => _weekly = weekly;
  double get monthly => _monthly;
  set monthly(double monthly) => _monthly = monthly;

  Averages.fromJson(Map<String, dynamic> json) {
    _daily = json['daily'];
    _weekly = json['weekly'];
    _monthly = json['monthly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['daily'] = this._daily;
    data['weekly'] = this._weekly;
    data['monthly'] = this._monthly;
    return data;
  }
}

class Changes {
  Averages _price;
  Averages _percent;

  Changes({Averages price, Averages percent}) {
    this._price = price;
    this._percent = percent;
  }

  Averages get price => _price;
  set price(Averages price) => _price = price;
  Averages get percent => _percent;
  set percent(Averages percent) => _percent = percent;

  Changes.fromJson(Map<String, dynamic> json) {
    _price =
        json['price'] != null ? new Averages.fromJson(json['price']) : null;
    _percent =
        json['percent'] != null ? new Averages.fromJson(json['percent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._price != null) {
      data['price'] = this._price.toJson();
    }
    if (this._percent != null) {
      data['percent'] = this._percent.toJson();
    }
    return data;
  }
}
