const int rpin=3;
const int gpin=22;
const int bpin=40;
int value=0;
int val = 0;
int i;

void setup() {
  for(i = 0; i < 5; i++){
    pinMode(i + rpin, OUTPUT);
    pinMode(i + bpin, OUTPUT);
    pinMode(i + gpin, OUTPUT);
    analogWrite(i + rpin, 0);
    analogWrite(i + gpin, 0);
    analogWrite(i + bpin, 0);
  }
}

void Color(int red, int green, int blue, int k, int dly){
  for( i = 0; i < k; i++ ){
    analogWrite(i + rpin, red);
    analogWrite(i + gpin, green);
    analogWrite(i + bpin, blue);
  }
  delay(dly * 10);
}

void showColor(int k){ 
  val = millis();
  Color(128 + 128 * sin(val), 128 + 128 * cos(val), 122*val + 122, k, 10);
}

void showColor2(){
  val = millis();
  Color(122*val + 122,128 + 128 * sin(val), 128 + 128 * cos(val), 5, 10);
}

void playColor(int t){
  showColor(5);
  delay(t);
}

void playColor2(int t){
  showColor2();
  delay(t);
}

void endColor(int t){
  analogWrite(3, 0);
  analogWrite(4, 0);
  analogWrite(5, 0);
  analogWrite(6, 0);
  analogWrite(7, 0);
  analogWrite(22, 0);
  analogWrite(23, 0);
  analogWrite(24, 0);
  analogWrite(25, 0);
  analogWrite(26, 0);
  analogWrite(40, 0);
  analogWrite(41, 0);
  analogWrite(42, 0);
  analogWrite(43, 0);
  analogWrite(44, 0);
  delay(t);
  delay(10);
}

void loop(){
  int k = 0;
  int t = 0;
  int opening = 21600;
  Serial.begin(115200);
  Serial.println(millis());
  for(;millis() < opening;){ 
    if( millis() - t > opening / 5){
      t = millis();
      k++;
    }
    Color(128 + 128 * sin(millis()), 128 + 128 * cos(millis()), 122*val + 122, k, 12);
  }
  Serial.println(millis());
  for(i = 0; i < 8; i++){
    playColor(600);
    playColor(600);
    playColor(400);
    playColor(250); 
    playColor(250);
    playColor(250);
    playColor(250);
    playColor(125);
    playColor(125);
  }
  endColor(5);
  for(i = 0; i < 3; i++){
    playColor(125);
    endColor(75);
    playColor(125);
    endColor(375);
    playColor(120);
    playColor2(120);
    playColor(120);
    playColor2(120);
    endColor(50);
    playColor(125);
    endColor(75);
    playColor(125);
    endColor(150);
    playColor(120);
    playColor2(120);
    playColor(120);
    playColor2(120);
    playColor(120);
    endColor(75);
  }
  
  playColor(125);
  endColor(100);
  playColor(125);
  endColor(325);
  playColor(125);
  playColor(125);
  playColor(125);
  playColor(125);
  endColor(75);
  playColor(125);
  endColor(100);
  playColor(125);
  endColor(150);
  playColor(125);
  playColor(125);
  playColor(125);
  playColor(125);
  playColor(100);
  playColor(100);
  playColor(125);
  playColor(125);
  playColor(125);
  playColor(125);
  playColor(125);
  playColor(125);
  playColor(125);
  endColor(62);
  for(i = 0; i < 1000; i++){
    playColor(125);
    endColor(75);
    playColor(125);
    endColor(325);
    playColor(125);
    playColor(125);
    playColor(125);
    playColor(125);
    endColor(75);
    playColor(125);
    endColor(100);
    playColor(125);
    endColor(150);
    playColor(125);
    playColor(125);
    playColor(125);
    playColor(125);
    playColor(125);
    endColor(50);
  }
}


