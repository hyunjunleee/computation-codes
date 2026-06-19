int rpin=11;
int gpin=10;
int bpin=9;
int value=0;
int val = 0;

void setup() {
  pinMode(rpin, OUTPUT);
  pinMode(gpin, OUTPUT);
  pinMode(bpin, OUTPUT);
}

void Color(int red, int green, int blue, int dly){
  analogWrite(rpin, red);
  analogWrite(gpin, green);
  analogWrite(bpin, blue);
  delay(dly * 10);
}
void showColor(){ 
  val = millis();
  Color(128 + 128 * sin(val), 128 + 128 * cos(val), 122*val + 122, 10);
}
void showColor2(){
  val = millis();
  Color(122*val + 122,128 + 128 * sin(val), 128 + 128 * cos(val), 10);
}
void playColor(int t){
  showColor();
  delay(t);
}
void playColor2(int t){
  showColor2();
  delay(t);
}
void endColor(int t){
  Color(0, 0, 0, 1);
  delay(t);
}

/*
void jumpColor(int t){
  val = millis();
  int i;
  int r = (128 + 128 * (int)sin(val))%256;
  int g = (128 + 128 * (int)cos(val))%256;
  int b = (122 * val + 122)%256;
  Color(r,g,b,1);
  delay(100);
  for(i = 0; i < t; i = i+10){
    Color(r - r*i/t, g - g*i/t, b - b*i/t, 1); 
  }
}
*/
void loop(){
  int i = 0;
  Serial.begin(115200);
  Serial.println(millis());
  for(;millis() < 21600;)
    playColor(25);
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
  /*
  Color(123, 122, 0, 5);
  Color(123, 122, 0, 5);
  Color(61, 123, 61, 5);
  Color(0, 122,123, 5);
  delay(500); 
  */
}


