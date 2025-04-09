// Define uma variavel que representa a porta que o arduino está conectado. 'int' pois é o valor é inteiro e não ira mudar enquanto o código estiver em vigor.
const int PINO_SENSOR_LDR = A1;

// Declara uma variável e que ela ira armazenar os dados coletados pelo arduino.
int valorLuminosidade;
float tensao5;
float resistorVoltagem;
float ldrVoltagem;
float ldrResistencia;
float ldrLux;;

// Cria uma função, ela declara a velocidade da comunicação com o computador.
void setup() {
  // velocidade 9600 bps
  Serial.begin(9600);
}

// Função que define o que irá ficar se repetindo (o que estiver dentro dela irá se repetir).
void loop() {
  // Função criada para ler os valores que estão na porta setada da variável em "()".
  valorLuminosidade = analogRead(PINO_SENSOR_LDR);
  
  // converte para tensão
  float tensao30 = valorLuminosidade * 5 / 1023.0;

  // Resitência do LDR 30k
  float rdr30 = (30000 * (5-tensao30) / tensao30);

  // tensão 5k 
  float tensao5 = 5 * (5000 * (5000 / (5000 - rdr30)));

  // leitura analogica de 5k
  int analogValue5k = tensao5 * 1023/ 5;

// Resistência para conversão de lux
  resistorVoltagem = (float)analogValue5k / 1023 * 5;

  // voltage across the LDR is the 5V supply minus the 5k resistor voltage
  ldrVoltagem = 5 - resistorVoltagem;

  // resistencia 5k
  ldrResistencia = ldrVoltagem / resistorVoltagem * 5030;
  // converte pra luminância
  ldrLux = 12518931 * pow(ldrResistencia, -1.405);

  
  // Coloca o texto no monitor serial.
  Serial.print("Luminosidade: ");

  // pula linha após inserir o valor.
  Serial.println(ldrLux);

  // Define o intervalo de tempo que virá uma nova informação do arduino ao meu computador.
  // pausando o programa por 2000 milissegundos (2seg).
  delay(2000);
}