// Assign Boxes and parameters for Boxes in this script. To be run with ARGO_TBH
// WALIII




void draw_ui() {

  BOXES_ACTIVE = [ 1 ]
  int BOX[1] = LNY18;
  int BOX[2] = 0;
  int BOX[3] = LNY20;
  int BOX[4] = LNY21;
  int BOX[5] = LNY22;
  int BOX[6] = LNY23;


 }

//========[ TEMPERATURE HUMIDITY LOGGER  ]==========//



  background(0, 0, 0);
fill(0, 102, 153, 204);
textSize(25);
text("ARGO Imaging Recording Room:", 10, 30);
fill(0, 102, 153, 204);
textSize(32);
text("TEMPERATURE:", 10, 60);
  fill(0, 200, 200, 200);
text(T, 10, 90);
fill(0, 102, 153, 204);
text("HUMIDITY:", 10, 120);
  fill(0, 200, 200, 200);
text(H, 10, 150);
fill(200, 200, 200, 204);
textSize(12);
text("=============[ BOX  STATUS ]====================", 10, 190);

spacer = 0;
for (int i = 0; i < 6; i = i+1) {

if(BOX[i] != 0){
spacer = spacer+20;
  long currentMillis[i] = millis();

  if(currentMillis[i] - previousMillis[i] >= 1000) {
    // save the last time you blinked the LED
    previousMillis[i] = currentMillis[i];
    timer[i] = timer[i]+1; }

TXT[i] = str('BOX')+ str(' ') + str(i) + str('OPEN');
fill(200, 0, 0, 204); textSize(32); text(TXT, 10, 220+spacer);
if(timer > 5){
fill(0, 200, 0, 204); textSize(32); text(timer[i], 10, 250+spacer); }
else{
fill(200, 0, 0, 204); textSize(32); text(timer[i], 10, 250+spacer);}


else{

TXT[i] = str('BOX')+ str(' ') + str(i) + str('CLOSED');
{ fill(0, 102, 153, 204); textSize(32); text(TXT, 10, 220+spacer);
if(timer > 5){
fill(0, 200, 0, 204); textSize(32); text(timer[i], 10, 250+spacer); }
else{
fill(200, 0, 0, 204); textSize(32); text(timer[i], 10, 250+spacer);}
  }
}
}
}
