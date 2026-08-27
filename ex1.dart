void main() {
  //declarando variaveis
  var equipamento = "impressora 3D";
  String local = 'lab prototipos';
  dynamic patrimonio = 12345;
  
  //altera valor patrimonio
  patrimonio = '12345-A';
  
  
  //imprimindo 
  print("--- Dados ---");
  print('Equipamento:  $equipamento');
  print('Local:  $local');
  print('Patrimonio:  $patrimonio');
  
  // operador 'is'
  print('equipamento é String ?: ${equipamento is String}');
  print('local é String ?: ${local is String}');
  print('patrimonio é String ?: ${patrimonio is String}');
  print('patrimonio é int ?: ${patrimonio is int}');
}