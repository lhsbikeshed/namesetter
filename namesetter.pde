import controlP5.*;
import oscP5.*;
import netP5.*;



OscP5 oscP5;
ControlP5 cp5;
NetAddress myRemoteLocation;                            
String serverIP = "10.0.0.100";                           


void setup() {   
  size(400, 500, P3D);
  cp5 = new ControlP5(this);
  oscP5 = new OscP5(this, 12005);
  myRemoteLocation = new NetAddress(serverIP, 12000);
  initGui();
}

void draw() {
  background(0);
}


void initGui() {
  /* player names */
  cp5.addTextfield("PilotName")
    .setPosition(10, 80)
      .setSize(200, 30)
        .setFont(createFont("arial", 12))
          .setAutoClear(false)
            ;
  cp5.addTextfield("TacticalName")
    .setPosition(10, 130)
      .setSize(200, 30)
        .setFont(createFont("arial", 12))
          .setAutoClear(false)
            ;
  cp5.addTextfield("EngineerName")
    .setPosition(10, 180)
      .setSize(200, 30)
        .setFont(createFont("arial", 12))
          .setAutoClear(false)
            ;

  cp5.addTextfield("CaptainName")
    .setPosition(10, 230)
      .setSize(200, 30)
        .setFont(createFont("arial", 12))
          .setAutoClear(false)
            ;
  cp5.addTextfield("GmName")
    .setPosition(10, 280)
      .setSize(200, 30)
        .setFont(createFont("arial", 12))
          .setAutoClear(false)
            ;

  cp5.addBang("SetNames")
    .setPosition(10, 322)
      .setSize(50, 50)
        .setTriggerEvent(Bang.RELEASE)
          .setLabel("Set")
            ;
}

public void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.getName().equals("SetNames")) {
    println("Setting name");
    OscMessage m = new OscMessage("/game/setNames");
    m.add(cp5.get(Textfield.class, "PilotName").getText());
    m.add(cp5.get(Textfield.class, "TacticalName").getText());
    m.add(cp5.get(Textfield.class, "EngineerName").getText());
    m.add(cp5.get(Textfield.class, "CaptainName").getText());
    m.add(cp5.get(Textfield.class, "GmName").getText());
    oscP5.send(m, myRemoteLocation);
  }
}

