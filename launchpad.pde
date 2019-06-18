import controlP5.*;
import themidibus.*;
ControlP5 cp5;
MidiBus bus;

int myColorBackground = color(0,0,0);
int toggle64 = 0;
int toggle68 = 0;
int toggle70 = 0;

Knob myKnobA;
Knob myKnobB;

void setup() {
  size(220, 480);
  smooth();
  noStroke();
  MidiBus.list();
  
  cp5 = new ControlP5(this);
  bus = new MidiBus(this, -1, "processing-midi");
  
  cp5.addButton("n64")
     .setValue(0)
     .setPosition(10, 10)
     .setSize(40, 40);
  
  cp5.addButton("n68")
     .setValue(100)
     .setPosition(60, 10)
     .setSize(40, 40);
     
  cp5.addButton("n70")
     .setPosition(110, 10)
     .setSize(40, 40)
     .setValue(0);
}

void draw() {
  background(10, 10, 10);
}

public void n64() {
  toggle64 = toggle64 == 0 ? 127 : 0;
  println("n64 " + toggle64);
  if (toggle64 == 0) {
    bus.sendNoteOff(0, 64, 0);
  } else {
    bus.sendNoteOn(0, 64, 127);
  }
}

public void n68() {
  toggle68 = toggle68 == 0 ? 127 : 0;
  println("n68 " + toggle68);
  if (toggle68 == 0) {
    bus.sendNoteOff(0, 68, 0);
  } else {
    bus.sendNoteOn(0, 68, 127);
  }
}

public void n70() {
  toggle70 = toggle70 == 0 ? 127 : 0;
  println("n70 " + toggle68);
  if (toggle70 == 0) {
    bus.sendNoteOff(0, 70, 0);
  } else {
    bus.sendNoteOn(0, 70, 127);
  }
}