import '../../data/model/company_model.dart';

class Company extends CompanyModel {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  }) : super(
          bs: bs,
          catchPhrase: catchPhrase,
          name: name,
        );

  String name;
  String catchPhrase;
  String bs;
}
