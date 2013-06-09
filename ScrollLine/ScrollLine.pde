#include <LiquidCrystal.h>
#include <string.h>

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

char message[] = "This is some long message that will end up scrolling";
int previous = 0;
int pos = 0;

void setup() {
  // set up the LCD's number of columns and rows: 
  lcd.begin(20, 4);
  // Print a message to the LCD.
  //lcd.print(message);
}

void printLine(int refreshSeconds){
  //Check if the current second since restart is a mod of refresh seconds , 
  //if it is then update the display , it must also not equal the previously 
  //stored value to prevent duplicate refreshes
  if((millis()/1000) % refreshSeconds == 0 && previous != (millis()/1000)){
    previous =  (millis()/1000);//Store the current time we entered for comparison on the next cycle
    lcd.setCursor(0, 1);//Set our draw position , set second param to 0 to use the top line
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

void loop() {  
  printLine(1);
}
