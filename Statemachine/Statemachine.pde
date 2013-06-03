// Franzis Arduino
// state machine (traffic lights)

int LEDred=12;
int LEDyellow=11;
int LEDgreen=10;
int cnt=0;
int state=1;

void setup()
{
    pinMode(LEDred, OUTPUT);
    pinMode(LEDyellow, OUTPUT);
    pinMode(LEDgreen, OUTPUT);
}

void loop()
{
    cnt++;
    if(cnt==100)
    {
	cnt=0;
	Statemachine();
    }
    
    delay(10);
}

void Statemachine(void)
{
    switch(state)
    {
	case 1:
	digitalWrite(LEDred, HIGH);
	digitalWrite(LEDyellow, LOW);
	digitalWrite(LEDgreen, LOW);
	state++;
	break;
		
	case 2:
	digitalWrite(LEDred, HIGH);
	digitalWrite(LEDyellow, HIGH);
	digitalWrite(LEDgreen, LOW);
	state++;
	break;
		
	case 3:
	digitalWrite(LEDred, LOW);
	digitalWrite(LEDyellow, LOW);
	digitalWrite(LEDgreen, HIGH);
	state++;
	break;
		
	case 4:
	digitalWrite(LEDred, LOW);
	digitalWrite(LEDyellow, HIGH);
	digitalWrite(LEDgreen, LOW);
	state=1;
	break;
    }
}

