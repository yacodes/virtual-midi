import controlP5.*;
import themidibus.*;
ControlP5 cp5;
MidiBus bus;

int myColorBackground = color(0,0,0);
int knobValue = 100;

Knob myKnobA;
Knob myKnobB;

void setup() {
  size(220, 480);
  smooth();
  noStroke();
  MidiBus.list();
  
  cp5 = new ControlP5(this);
  bus = new MidiBus(this, -1, "processing-midi");
  
  cp5.addKnob("GAIN1")
     .setRange(0,127)
     .setValue(100)
     .setPosition(0, 0)
     .setRadius(50)
     .setDragDirection(Knob.VERTICAL);
  
  cp5.addKnob("SPEED1")
     .setRange(0,127)
     .setValue(64)
     .setPosition(120, 0)
     .setRadius(50)
     .setDragDirection(Knob.VERTICAL);
               
  cp5.addKnob("FILTER1")
     .setRange(0,127)
     .setValue(64)
     .setPosition(0, 120)
     .setRadius(50)
     .setDragDirection(Knob.VERTICAL);

  cp5.addKnob("PLY1")
     .setRange(0,127)
     .setValue(0)
     .setPosition(120, 120)
     .setRadius(50)
     .setDragDirection(Knob.VERTICAL);
 
  cp5.addKnob("ROOM1")
    .setRange(0,127)
    .setValue(0)
    .setPosition(120, 240)
    .setRadius(50)
    .setDragDirection(Knob.VERTICAL);
    
  cp5.addKnob("DELAY1")
    .setRange(0,127)
    .setValue(0)
    .setPosition(120, 360)
    .setRadius(50)
    .setDragDirection(Knob.VERTICAL);
  
  cp5.addKnob("CRUSH1")
    .setRange(0,127)
    .setValue(0)
    .setPosition(0, 240)
    .setRadius(50)
    .setDragDirection(Knob.VERTICAL);
    
  cp5.addKnob("DEGRADE1")
    .setRange(0,127)
    .setValue(0)
    .setPosition(0, 360)
    .setRadius(50)
    .setDragDirection(Knob.VERTICAL);
}

void draw() {
  background(10, 10, 10);
}

void CRUSH1(int value) {
  bus.sendControllerChange(0, 8, value);
  println("Change crush1: " + value);
}

void DEGRADE1(int value) {
  bus.sendControllerChange(0, 12, value);
  println("Change degrade1: " + value);
}

void ROOM1(int value) {
  bus.sendControllerChange(0, 9, value);
  println("Change room1: " + value);
}

void DELAY1(int value) {
  bus.sendControllerChange(0, 13, value);
  println("Change delay1: " + value);
}

void GAIN1(int value) {
  bus.sendControllerChange(0, 0, value);
  println("Change gain1: " + value);
}

void SPEED1(int value) {
  bus.sendControllerChange(0, 1, value);
  println("Change speed1: " + value);
}

void PLY1(int value) {
  bus.sendControllerChange(0, 3, value);
  println("Change fast?1: " + value);
}

void FILTER1(int value) {
  bus.sendControllerChange(0, 4, value);
  println("Change filter1: " + value);
}


void keyPressed() {
  switch(key) {
    case('1'):myKnobA.setValue(180);break;
    case('2'):myKnobB.setConstrained(false).hideTickMarks().snapToTickMarks(false);break;
    case('3'):myKnobA.shuffle();myKnobB.shuffle();break;
  }
  
}

/*
a list of all methods available for the Knob Controller
use ControlP5.printPublicMethodsFor(Knob.class);
to print the following list into the console.

You can find further details about class Knob in the javadoc.

Format:
ClassName : returnType methodName(parameter type)
 
controlP5.Knob : Knob setConstrained(boolean) 
controlP5.Knob : Knob setDragDirection(int) 
controlP5.Knob : Knob setMax(float) 
controlP5.Knob : Knob setMin(float) 
controlP5.Knob : Knob setNumberOfTickMarks(int) 
controlP5.Knob : Knob setRadius(float) 
controlP5.Knob : Knob setRange(float) 
controlP5.Knob : Knob setResolution(float) 
controlP5.Knob : Knob setScrollSensitivity(float) 
controlP5.Knob : Knob setSensitivity(float) 
controlP5.Knob : Knob setShowRange(boolean) 
controlP5.Knob : Knob setStartAngle(float) 
controlP5.Knob : Knob setTickMarkLength(int) 
controlP5.Knob : Knob setTickMarkWeight(float) 
controlP5.Knob : Knob setValue(float) 
controlP5.Knob : Knob setViewStyle(int) 
controlP5.Knob : Knob showTickMarks(boolean) 
controlP5.Knob : Knob shuffle() 
controlP5.Knob : Knob snapToTickMarks(boolean) 
controlP5.Knob : Knob update() 
controlP5.Knob : boolean isConstrained() 
controlP5.Knob : boolean isShowRange() 
controlP5.Knob : boolean isShowTickMarks() 
controlP5.Knob : float getAngle() 
controlP5.Knob : float getRadius() 
controlP5.Knob : float getRange() 
controlP5.Knob : float getResolution() 
controlP5.Knob : float getStartAngle() 
controlP5.Knob : float getTickMarkWeight() 
controlP5.Knob : float getValue() 
controlP5.Knob : int getDragDirection() 
controlP5.Knob : int getNumberOfTickMarks() 
controlP5.Knob : int getTickMarkLength() 
controlP5.Knob : int getViewStyle() 
controlP5.Controller : CColor getColor() 
controlP5.Controller : ControlBehavior getBehavior() 
controlP5.Controller : ControlWindow getControlWindow() 
controlP5.Controller : ControlWindow getWindow() 
controlP5.Controller : ControllerProperty getProperty(String) 
controlP5.Controller : ControllerProperty getProperty(String, String) 
controlP5.Controller : Knob addCallback(CallbackListener) 
controlP5.Controller : Knob addListener(ControlListener) 
controlP5.Controller : Knob bringToFront() 
controlP5.Controller : Knob bringToFront(ControllerInterface) 
controlP5.Controller : Knob hide() 
controlP5.Controller : Knob linebreak() 
controlP5.Controller : Knob listen(boolean) 
controlP5.Controller : Knob lock() 
controlP5.Controller : Knob plugTo(Object) 
controlP5.Controller : Knob plugTo(Object, String) 
controlP5.Controller : Knob plugTo(Object[]) 
controlP5.Controller : Knob plugTo(Object[], String) 
controlP5.Controller : Knob registerProperty(String) 
controlP5.Controller : Knob registerProperty(String, String) 
controlP5.Controller : Knob registerTooltip(String) 
controlP5.Controller : Knob removeBehavior() 
controlP5.Controller : Knob removeCallback() 
controlP5.Controller : Knob removeCallback(CallbackListener) 
controlP5.Controller : Knob removeListener(ControlListener) 
controlP5.Controller : Knob removeProperty(String) 
controlP5.Controller : Knob removeProperty(String, String) 
controlP5.Controller : Knob setArrayValue(float[]) 
controlP5.Controller : Knob setArrayValue(int, float) 
controlP5.Controller : Knob setBehavior(ControlBehavior) 
controlP5.Controller : Knob setBroadcast(boolean) 
controlP5.Controller : Knob setCaptionLabel(String) 
controlP5.Controller : Knob setColor(CColor) 
controlP5.Controller : Knob setColorActive(int) 
controlP5.Controller : Knob setColorBackground(int) 
controlP5.Controller : Knob setColorCaptionLabel(int) 
controlP5.Controller : Knob setColorForeground(int) 
controlP5.Controller : Knob setColorValueLabel(int) 
controlP5.Controller : Knob setDecimalPrecision(int) 
controlP5.Controller : Knob setDefaultValue(float) 
controlP5.Controller : Knob setHeight(int) 
controlP5.Controller : Knob setId(int) 
controlP5.Controller : Knob setImages(PImage, PImage, PImage) 
controlP5.Controller : Knob setImages(PImage, PImage, PImage, PImage) 
controlP5.Controller : Knob setLabelVisible(boolean) 
controlP5.Controller : Knob setLock(boolean) 
controlP5.Controller : Knob setMax(float) 
controlP5.Controller : Knob setMin(float) 
controlP5.Controller : Knob setMouseOver(boolean) 
controlP5.Controller : Knob setMoveable(boolean) 
controlP5.Controller : Knob setPosition(PVector) 
controlP5.Controller : Knob setPosition(float, float) 
controlP5.Controller : Knob setSize(PImage) 
controlP5.Controller : Knob setSize(int, int) 
controlP5.Controller : Knob setStringValue(String) 
controlP5.Controller : Knob setUpdate(boolean) 
controlP5.Controller : Knob setValueLabel(String) 
controlP5.Controller : Knob setView(ControllerView) 
controlP5.Controller : Knob setVisible(boolean) 
controlP5.Controller : Knob setWidth(int) 
controlP5.Controller : Knob show() 
controlP5.Controller : Knob unlock() 
controlP5.Controller : Knob unplugFrom(Object) 
controlP5.Controller : Knob unplugFrom(Object[]) 
controlP5.Controller : Knob unregisterTooltip() 
controlP5.Controller : Knob update() 
controlP5.Controller : Knob updateSize() 
controlP5.Controller : Label getCaptionLabel() 
controlP5.Controller : Label getValueLabel() 
controlP5.Controller : List getControllerPlugList() 
controlP5.Controller : PImage setImage(PImage) 
controlP5.Controller : PImage setImage(PImage, int) 
controlP5.Controller : PVector getAbsolutePosition() 
controlP5.Controller : PVector getPosition() 
controlP5.Controller : String getAddress() 
controlP5.Controller : String getInfo() 
controlP5.Controller : String getName() 
controlP5.Controller : String getStringValue() 
controlP5.Controller : String toString() 
controlP5.Controller : Tab getTab() 
controlP5.Controller : boolean isActive() 
controlP5.Controller : boolean isBroadcast() 
controlP5.Controller : boolean isInside() 
controlP5.Controller : boolean isLabelVisible() 
controlP5.Controller : boolean isListening() 
controlP5.Controller : boolean isLock() 
controlP5.Controller : boolean isMouseOver() 
controlP5.Controller : boolean isMousePressed() 
controlP5.Controller : boolean isMoveable() 
controlP5.Controller : boolean isUpdate() 
controlP5.Controller : boolean isVisible() 
controlP5.Controller : float getArrayValue(int) 
controlP5.Controller : float getDefaultValue() 
controlP5.Controller : float getMax() 
controlP5.Controller : float getMin() 
controlP5.Controller : float getValue() 
controlP5.Controller : float[] getArrayValue() 
controlP5.Controller : int getDecimalPrecision() 
controlP5.Controller : int getHeight() 
controlP5.Controller : int getId() 
controlP5.Controller : int getWidth() 
controlP5.Controller : int listenerSize() 
controlP5.Controller : void remove() 
controlP5.Controller : void setView(ControllerView, int) 
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 


*/