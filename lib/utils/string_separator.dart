

String formatString({required String value}){
  String priceInText = "";
  int counter = 0;
  for(int i = (value.length - 1);  i >= 0; i--){
    counter++;
    String str = value[i];
    if((counter % 3) != 0 && i !=0){
      priceInText = "$str$priceInText";
    }else if(i == 0 ){
      priceInText = "$str$priceInText";

    }else{
      priceInText = ",$str$priceInText";
    }
  }
  return priceInText.trim();
}