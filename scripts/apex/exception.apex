System.debug('welecome apex');
public class InsuffisinentFundsException extends Exception {};



Decimal balanceAmount=10000;
Decimal totalAmount;
try{
Decimal withdrawAmount=50000;
if(withdrawAmount<balanceAmount){
 totalAmount=balanceAmount-withdrawAmount;
}else{
InsuffisinentFundsException ie=new InsuffisinentFundsException('insuffuent funds');

throw ie;
}

}catch(InsuffisinentFundsException e){
System.debug(e.getMessage());

}
List<String> fruitsList=new List<String>();
fruitsList.add('Apple');
fruitsList.add('Orange');
String s;
try{
String value=fruitsList.get(1);

System.debug(10/2);
System.debug(value);

 Boolean b = s.contains('abc');

// }catch(Exception e){
//     System.debug(e.getTypeName());
// System.debug(e.getMessage());
// }
}catch(ListException me){
System.debug(me.getTypeName());
System.debug(me.getMessage());

}
catch(ArthmeticException me){
System.debug(me.getTypeName());
System.debug(me.getMessage());

}
catch(NullPointerException me){
System.debug(me.getTypeName());
System.debug(me.getMessage());

}
finally{
System.debug('test');
}
System.debug('end');

String str='welcome';
System.debug(str.reverse());
System.debug(str);
