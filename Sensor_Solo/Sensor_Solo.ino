const int ValorAr = 550;
const int ValorAgua = 230;

int valorUmidadeSolo = 0;
float porcentagemUmidade = 0;

const int Limite = 75;

void setup(){
  Serial.begin(9600);
}

void loop() {
  valorUmidadeSolo = analogRead(A1);

  int faixa = ValorAr - ValorAgua;

  int distancia = ValorAr - valorUmidadeSolo;

  porcentagemUmidade = (float)distancia / faixa * 100.0;

  if (porcentagemUmidade < 0) porcentagemUmidade = 0;
  if (porcentagemUmidade > 100) porcentagemUmidade = 100;

  Serial.print("Leitura bruta: ");
  Serial.print(valorUmidadeSolo);
  Serial.print(" | Umidade: ");
  Serial.print(porcentagemUmidade);
  Serial.println("%");

  /*
  Serial.println(valorUmidadeSolo);
  Serial.println(porcentagemUmidade);
  */
  

  delay(1000);
}