// Franzis Arduino
// sound

int Speaker=8;

void setup()
{
    pinMode(Speaker, OUTPUT);
}

void loop()
{
    tone(Speaker, 550, 450);
    delay(3000);
    tone(Speaker, 450, 450);
    delay(3000);
    tone(Speaker, 550, 450);
    delay(3000);
}

