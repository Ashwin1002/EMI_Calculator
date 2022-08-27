class EMIModel {
  late final int month;
  late final int opening;
  late final int principal;
  late final int interest;
  late final int emi;
  late final int closing;

  EMIModel();

  EMIModel.name({
    required this.month,
    required this.opening,
    required this.principal,
    required this.interest,
    required this.emi,
    required this.closing,
  });
}
