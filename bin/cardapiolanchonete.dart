import 'dart:io';

String input({required mensagem}) {
  String? input;
  while (input == null) {
    print(mensagem);
    input = stdin.readLineSync();
  }
  return input;
}

void main() {
  Map<int, dynamic> cardapio = {
    100: {"nome": "cachorro quente", "preco": 5.00},
    101: {"nome": "bauru simples", "preco": 6.00},
    102: {"nome": "bauru com ovo", "preco": 5.50},
    103: {"nome": "x-tudo", "preco": 8.50},
    104: {"nome": "x-burguer", "preco": 6.00},
    105: {"nome": "refresco", "preco": 2.50},
    106: {"nome": "refrigerente", "preco": 3.80},
  };

  cardapio.forEach(
    (key, value) {
      print("$key $value");
    },
  );

  final pedido = input(mensagem: "Deseja fazer pedido? (s/n)").toLowerCase();
  switch (pedido) {
    case "s":
      valorPagar(fazerPedido(), cardapio);
      break;
    case "n":
      print("ok, até mais tarde!");
      break;

    default:
      print("não entendi");
      main();
      break;
  }
}

List<int> fazerPedido() {
  String finalizar = "n";
  List<int> pedido = [];

  do {
    final codProduto = int.parse(input(mensagem: "digite o codigo do produto"));
    pedido.add(codProduto);
    finalizar = input(mensagem: "deseja finalizar seu pedido? (s/n)");

  } while (finalizar == "n");

  return pedido;
}

void valorPagar(List<int> pedidos, Map<int, dynamic> menu) {
  double valor = 0.00;

  for (int pedido in pedidos) {
    print(
      "codigo: $pedido"
      "nome: ${menu[pedido]["nome"]}" 
      "valor: R\$ ${menu[pedido]["preco"]}",
    );

    valor += menu[pedido]["preco"];
  }
  print(valor);
}
