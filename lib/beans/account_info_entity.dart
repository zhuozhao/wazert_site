class AccountInfoEntity {
	String msg;
	List<AccountInfoCompany> companys;
	String resultcode;
	String userid;
	String account;
	String username;

	AccountInfoEntity({this.msg, this.companys, this.resultcode, this.userid, this.account, this.username});

	AccountInfoEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		if (json['companys'] != null) {
			companys = new List<AccountInfoCompany>();(json['companys'] as List).forEach((v) { companys.add(new AccountInfoCompany.fromJson(v)); });
		}
		resultcode = json['resultcode'];
		userid = json['userid'];
		account = json['account'];
		username = json['username'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		if (this.companys != null) {
      data['companys'] =  this.companys.map((v) => v.toJson()).toList();
    }
		data['resultcode'] = this.resultcode;
		data['userid'] = this.userid;
		data['account'] = this.account;
		data['username'] = this.username;
		return data;
	}
}

class AccountInfoCompany {
	List<AccountInfoCompanysCar> cars;
	String companyid;
	String companyname;

	AccountInfoCompany({this.cars, this.companyid, this.companyname});

	AccountInfoCompany.fromJson(Map<String, dynamic> json) {
		if (json['cars'] != null) {
			cars = new List<AccountInfoCompanysCar>();(json['cars'] as List).forEach((v) { cars.add(new AccountInfoCompanysCar.fromJson(v)); });
		}
		companyid = json['companyid'];
		companyname = json['companyname'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.cars != null) {
      data['cars'] =  this.cars.map((v) => v.toJson()).toList();
    }
		data['companyid'] = this.companyid;
		data['companyname'] = this.companyname;
		return data;
	}
}

class AccountInfoCompanysCar {
	int busid;
	int maxoil;
	String registerip;
	String buslicplate;
	String mediaport;
	String vpassword;
	String registerport;
	int channelnum;
	String videodevice;
	double speed;
	String busownercode;
	String mediaip;
	String vusername;
	int angle;
	String time;
	double dimy;
	double dimx;

	AccountInfoCompanysCar({this.busid, this.maxoil, this.registerip, this.buslicplate, this.mediaport, this.vpassword, this.registerport, this.channelnum, this.videodevice, this.speed, this.busownercode, this.mediaip, this.vusername, this.angle, this.time, this.dimy, this.dimx});

	AccountInfoCompanysCar.fromJson(Map<String, dynamic> json) {
		busid = json['busid'];
		maxoil = json['maxoil'];
		registerip = json['registerip'];
		buslicplate = json['buslicplate'];
		mediaport = json['mediaport'];
		vpassword = json['vpassword'];
		registerport = json['registerport'];
		channelnum = json['channelnum'];
		videodevice = json['videodevice'];
		speed = json['speed'];
		busownercode = json['busownercode'];
		mediaip = json['mediaip'];
		vusername = json['vusername'];
		angle = json['angle'];
		time = json['time'];
		dimy = json['dimy'];
		dimx = json['dimx'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['busid'] = this.busid;
		data['maxoil'] = this.maxoil;
		data['registerip'] = this.registerip;
		data['buslicplate'] = this.buslicplate;
		data['mediaport'] = this.mediaport;
		data['vpassword'] = this.vpassword;
		data['registerport'] = this.registerport;
		data['channelnum'] = this.channelnum;
		data['videodevice'] = this.videodevice;
		data['speed'] = this.speed;
		data['busownercode'] = this.busownercode;
		data['mediaip'] = this.mediaip;
		data['vusername'] = this.vusername;
		data['angle'] = this.angle;
		data['time'] = this.time;
		data['dimy'] = this.dimy;
		data['dimx'] = this.dimx;
		return data;
	}
}
