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

  print("Seja bem vindo a calculadora de juros! v1.0.0");
  print("1. Calcular juros simples.");
  print("2. Calcular juros compostos.");

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

void calcJurosSimples() {
  
  String? juroSimplesInput = "";
  double montante = 0;
  double capitalInicial = 0;
  double taxaJuros = 0;
  int tempo = 0; 
  double jurosLucro = 0;

  print("Calculadora de juros simples selecionada");

  stdout.write("Digite o valor inicial: ");
  juroSimplesInput = stdin.readLineSync()!;
  capitalInicial =  double.parse(juroSimplesInput);

  stdout.write("Digite a taxa de juros ao ano: ");
  juroSimplesInput = stdin.readLineSync()!;
  taxaJuros = double.parse(juroSimplesInput);

  stdout.write("Digite o tempo em anos: ");
  juroSimplesInput = stdin.readLineSync()!;
  tempo= int.parse(juroSimplesInput);

  taxaJuros = taxaJuros / 100;
  montante = capitalInicial  + (capitalInicial * taxaJuros * tempo);
  jurosLucro = montante - capitalInicial;

  if (tempo <= 1) {
    print("O montante será de R\$${montante.toStringAsFixed(2)} reais ao fim de $tempo ano e os juros acumulados serão de R\$${jurosLucro.toStringAsFixed(2)} reais.");
    
  } else {
    print("O montante será de R\$${montante.toStringAsFixed(2)} reais ao fim de $tempo anos e os juros acumulados serão de R\$${jurosLucro.toStringAsFixed(2)} reais.");
  }

}

void calcJurosComposto() {
  String? juroCompostoInput = "";
  double montante = 0;
  double capitalInicial = 0;
  double taxaJuros = 0;
  int tempoAno = 0;
  double jurosLucro = 0;

  print("Calculadora de juros compostos selecionada");

  stdout.write("Digite o valor inicial: ");
  juroCompostoInput = stdin.readLineSync()!;
  capitalInicial = double.parse(juroCompostoInput);

  stdout.write("Digite a taxa de juros ao ano: ");
  juroCompostoInput = stdin.readLineSync()!;
  taxaJuros = double.parse(juroCompostoInput);

  stdout.write("Digite o tempo em anos: ");
  juroCompostoInput = stdin.readLineSync()!;
  tempoAno = int.parse(juroCompostoInput);

  taxaJuros = taxaJuros / 100;
  montante = capitalInicial * pow((1 + taxaJuros), tempoAno);
  jurosLucro = montante - capitalInicial;

  if (tempoAno <= 1) {
    print("O montante será de R\$${montante.toStringAsFixed(2)} reais ao fim de $tempoAno ano e os juros acumulados serão de R\$${jurosLucro.toStringAsFixed(2)} reais.");

  } else {
    print("O montante será de R\$${montante.toStringAsFixed(2)} reais ao fim de $tempoAno anos e os juros acumulados serão de R\$${jurosLucro.toStringAsFixed(2)} reais.");

  }

}
