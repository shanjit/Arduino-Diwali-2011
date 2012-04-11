 
 // Graphing sketch
 
 
 // This program takes ASCII-encoded strings
 // from the serial port at 9600 baud and graphs them. It expects values in the
 // range 0 to 1023, followed by a newline, or newline and carriage return
 
 // Created 20 Apr 2005
 // Updated 18 Jan 2008
 // by Tom Igoe
 // This example code is in the public domain.
 
 import processing.serial.*;
 
 Serial myPort;        // The serial port
 int xPos = 150;         // horizontal position of the graph
 
 void setup () {
 // set the window size:
 size(320, 240);        
 
 // List all the available serial ports
 println(Serial.list());
 // I know that the first port in the serial list on my mac
 // is always my  Arduino, so I open Serial.list()[0].
 // Open whatever port is the one you're using.
 myPort = new Serial(this, Serial.list()[0], 9600);
 // don't generate a serialEvent() unless you get a newline character:
 myPort.bufferUntil('\n');
 // set inital background:
 background(0);
 }
 void draw () {
 // everything happens in the serialEvent()
 }
 
 void serialEvent (Serial myPort) {
 background(0);

   // get the ASCII string:
 String inString1 = myPort.readStringUntil('\n');
 String[] listing =split(inString1,'.');
 String inString = listing[1];
 listing = null;



 
 if (inString != null) {
 // trim off any whitespace:
 inString = trim(inString);
 // convert to an int and map to the screen height:
 float inByte = float(inString); 
 inByte = map(inByte, 0, 1023, 0, height);
 
 // draw the line:
 stroke(127,34,255); 
 ellipse(160,120,inByte,inByte); 
/* line(160, height,160, height - inByte);
  line(165, height,165, height - inByte);
   line(155, height,155, height - inByte);
    line(170, height,170, height - inByte);
     line(150, height,150, height - inByte);*/
 delay(10);
 
 // at the edge of the screen, go back to the beginning:
 /*if (xPos >= width) {
 xPos = 0;
 background(0); 
 } 
 else {
 // increment the horizontal position:
 xPos=xPos+5;
 }*/
 }
 }
