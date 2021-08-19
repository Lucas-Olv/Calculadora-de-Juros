import 'dart:convert';
import 'dart:io';
import 'dart:math';

int main() 
{
telaInicial();
return  0;
}

//Função de boas vindas e apresentação do menu
void telaInicial() {
  var selecionarMenu = 0;
  var selecionarMenuInput = "";

  print("\nSeja bem vindo a calculadora de juros! v1.0.2 \n" );
  print("1. Calcular juros simples.");
  print("2. Calcular juros compostos. \n");

  do {
    stdout.write("Por favor digite a opção desejada: ");
    selecionarMenuInput = stdin.readLineSync()!;

    if((selecionarMenuInput == "1") || (selecionarMenuInput == "2")) {
      selecionarMenu = int.parse(selecionarMenuInput);

      switch (selecionarMenu) {
        case 1:
        calcJurosSimples();
        break;

        case 2:
        calcJurosComposto();
        break;
      }
      break;
    }else {
      print("Opção inválida, tente novamente.");
    }
  } while (true);
}

// Calcula os juros simples e escreve na tela o montante e o lucro em juros.
void calcJurosSimples() {
  
  String? juroSimplesInput = "";
  double montante = 0;
  double capitalInicial = 0;
  double taxaJuros = 0;
  double tempoAno = 0; 
  double jurosLucro = 0;

  print("\nCalculadora de juros simples selecionada \n");

  stdout.write("Digite o valor inicial: ");
  capitalInicial = checarLetras(juroSimplesInput, capitalInicial);

  stdout.write("Digite a taxa de juros ao ano: ");
  taxaJuros = checarLetras(juroSimplesInput, taxaJuros);

  stdout.write("Digite o tempo em anos: ");
  tempoAno = checarLetras(juroSimplesInput, tempoAno);

  taxaJuros = taxaJuros / 100;
  montante = capitalInicial  + (capitalInicial * taxaJuros * tempoAno);
  jurosLucro = montante - capitalInicial;

  if (tempoAno <= 1) {
    print("\nO montante será de R\$${montante.toStringAsFixed(2)} reais ao fim de ${tempoAno.toStringAsFixed(0)} ano e os juros acumulados serão de R\$${jurosLucro.toStringAsFixed(2)} reais.\n");
    
  } else {
    print("\nO montante será de R\$${montante.toStringAsFixed(2)} reais ao fim de ${tempoAno.toStringAsFixed(0)} anos e os juros acumulados serão de R\$${jurosLucro.toStringAsFixed(2)} reais.\n");
  }

}

// Calcula os juros compostos e escreve na tela o montante e o lucro em juros.
void calcJurosComposto() {
  String? juroCompostoInput = "";
  double montante = 0;
  double capitalInicial = 0;
  double taxaJuros = 0;
  double tempoAno = 0;
  double jurosLucro = 0;

  print("\nCalculadora de juros compostos selecionada \n");

  stdout.write("Digite o valor inicial: ");
  capitalInicial = checarLetras(juroCompostoInput, capitalInicial);

  stdout.write("Digite a taxa de juros ao ano: ");
  taxaJuros = checarLetras(juroCompostoInput, taxaJuros);

  stdout.write("Digite o tempo em anos: ");
  tempoAno = checarLetras(juroCompostoInput, tempoAno);

  taxaJuros = taxaJuros / 100;
  montante = capitalInicial * pow((1 + taxaJuros), tempoAno);
  jurosLucro = montante - capitalInicial;

  if (tempoAno <= 1) {
    print("\nO montante será de R\$${montante.toStringAsFixed(2)} reais ao fim de ${tempoAno.toStringAsFixed(0)} ano e os juros acumulados serão de R\$${jurosLucro.toStringAsFixed(2)} reais.\n");

  } else {
    print("\nO montante será de R\$${montante.toStringAsFixed(2)} reais ao fim de ${tempoAno.toStringAsFixed(0)} anos e os juros acumulados serão de R\$${jurosLucro.toStringAsFixed(2)} reais.\n");

  }

}

// Confere se as entradas do usuário são apenas números, depois converte para double.
checarLetras(String? a, double b) {
  final charProibido = RegExp(r'^([^a-z-A-Z-0-9]|[a-z-A-Z]/s)*$');

  do {
    a = stdin.readLineSync()!;

    if ((a.contains(charProibido))) {
      stdout.write("Valor inválido, tente novamente:");

    } else {
      b = double.parse(a);
      break;
    }

  } while (true);

  return b;
}
