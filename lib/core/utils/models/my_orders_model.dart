class MyOrdersModel {
  String title;
  String subTitle;
  num price;
  String count;
  String code;
  String? date;

  MyOrdersModel(
      {required this.title,
      required this.subTitle,
      required this.price,
      required this.count,
      required this.code, this.date
      });
}
