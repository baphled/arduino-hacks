#include <LiquidCrystal.h>
String stringIn = "";// for incoming serial data

LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

void setup() {
  Serial.begin(9600);     // opens serial port, sets data rate to 9600 bps
  lcd.begin(20, 4);
  lcd.setCursor(0, 0);
  lcd.print("Enter input:");
  delay(1000);
}

void loop() {

  // send data only when you receive data:
  if (Serial.available() > 0) {
    lcd.clear();
    // read the incoming byte:
    stringIn = Serial.readString();
    stringToLCD();
    /*lcd.print(stringIn);*/
  }
}

void stringToLCD() {
  int lineCount = 0;
  int lineNumber = 0;
  byte stillProcessing = 1;
  byte charCount = 1;
  lcd.clear();
  lcd.setCursor(0,0);

  while(stillProcessing) {
    if (++lineCount > 20) {    // have we printed 20 characters yet (+1 for the logic)
      lineNumber += 1;
      lcd.setCursor(0,lineNumber);   // move cursor down
      lineCount = 1;
    }

    lcd.print(stringIn[charCount - 1]);

    if (!stringIn[charCount]) {   // no more chars to process?
      stillProcessing = 0;
    }
    charCount += 1;
  }
}
