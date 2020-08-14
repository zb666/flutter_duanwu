/**
 * Flutter实战了解下
 */

void main(){


  var choice = null;
  var result = choice??111;
  print('choice :$choice');
  var choiceResult = choice??=123;
  print('$choice $result $choiceResult');

}