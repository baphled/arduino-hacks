/*
   Menu based application to help keep up to date with a project.

  The idea of this is to connect to an API that serves up to date information about a project.

  This application was designed for the 20x4 16pin LCD

 */

#include <LiquidCrystal.h>

// Define the API server to retrieve data from
// For the moment this data will be polled for a over serial bus
/*#define SERVER = "192.168.1.23";*/

// TODO: Auto scroll on a single line

String stringIn = "";// for incoming serial data

int previous = 0;
int pos = 0;

LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

void setup() {
  Serial.begin(9600);     // opens serial port, sets data rate to 9600 bps
  lcd.begin(20, 4);
  // TODO: Add ascii art
  lcd.print("LCDevops");
  delay(1000);
  displayHelp();
}

void loop() {
  if (Serial.available() > 0) {
    lcd.clear();
    lcd.setCursor(0, 1);
    String stringIn = Serial.readString();
    if(stringIn == "1") {
      lcd.print("Deploys screen");
      char errorMessage[] = "A list of deploys messages relating to the application that is being monitored";
      while(Serial.available() == 0) {
        printErrors(1, errorMessage);
      }
    }
    if(stringIn == "2") {
      lcd.print("Commits");
      char errorMessage[] = "A list of commit messages relating to the application that is being monitored";
      while(Serial.available() == 0) {
        printErrors(1, errorMessage);
      }
    }
    if(stringIn == "3") {
      lcd.print("Errors");
      char errorMessage[] = "A list of errors relating to the application that is being monitored";
      while(Serial.available() == 0) {
        printErrors(1, errorMessage);
      }
    }
    if(stringIn == "4") {
      lcd.setCursor(0, 1);
      lcd.print("Set server:");
    }
    if (stringIn == "0") {
      displayHelp();
    }
  }
}

void printErrors(int refreshSeconds, char* message){
  //Check if the current second since restart is a mod of refresh seconds , 
  //if it is then update the display , it must also not equal the previously 
  //stored value to prevent duplicate refreshes
  if((millis()/1000) % refreshSeconds == 0 && previous != (millis()/1000)){
    previous =  (millis()/1000);//Store the current time we entered for comparison on the next cycle
    lcd.setCursor(0, 3);//Set our draw position , set second param to 0 to use the top line
    char lcdTop[20];//Create a char array to store the text for the line
    int copySize = 20; // What is the size of our screen , this could probably be moved outside the loop but its more dynamic like this
    if(strlen(message) < 20)
    {
      //if the message is bigger than the current buffer use its length instead;
      copySize = strlen(message);
    }
    //Store the current position temporarily and invert its sign if its negative since we are going in reverse
    int tempPos = pos;
    if(tempPos < 0)
    {
      tempPos = -(tempPos);
    }
    //Build the lcd text by copying the required text out of our template message variable 
    memcpy(&lcdTop[0],&message[tempPos],copySize);
    lcd.print(lcdTop);//Print it from position 0
    //Increase the current position and check if the position + 16 (screen size) would be larger than the message length , if it is go in reverse by inverting the sign.
    pos += 1;
    if(pos +20 >= strlen(message))
    {
      pos = -(pos);
    }
  }
}

/*
  Display the help menu for the application

*/
void displayHelp() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("#1 Deploys");
  lcd.setCursor(10, 0);
  lcd.print("#2 Commits");
  lcd.setCursor(0, 1);
  lcd.print("#3 Errors");
  lcd.setCursor(10, 1);
  lcd.print("#4 Config");
  lcd.setCursor(0, 2);
  lcd.print("#0 Help");
}
