#include <LiquidCrystal.h>
String incomingByte = "";// for incoming serial data

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
    incomingByte = Serial.readString();
    lcd.print(incomingByte);
  }
}
