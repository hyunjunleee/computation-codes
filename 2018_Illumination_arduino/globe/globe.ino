int led = 9;           
int brightness = 0;    
int fadeAmount = 3;    

void setup() {
  pinMode(led, OUTPUT);
  delay(80000);
}

void loop() {
  analogWrite(led, brightness);

  brightness = brightness + fadeAmount;

  if (brightness >= 255) {
    delay(3000);
    fadeAmount = -fadeAmount;
  }
  if (brightness <= 0) {
    fadeAmount = -fadeAmount;
  }
  delay(30);
}
