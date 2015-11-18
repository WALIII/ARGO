void draw_ui() {
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



if(STAT ==0){;
  long currentMillis = millis();
 
  if(currentMillis - previousMillis >= 1000) {
    // save the last time you blinked the LED 
    previousMillis = currentMillis;
    timer = timer+1; }


fill(200, 0, 0, 204); textSize(32); text("BOX01 OPEN", 10, 220);
if(timer > 5){
fill(0, 200, 0, 204); textSize(32); text(timer, 10, 250); }
else{
fill(200, 0, 0, 204); textSize(32); text(timer, 10, 250);}
}

else{ fill(0, 102, 153, 204); textSize(32); text("BOX 01 CLOSED", 10, 220); 
if(timer > 5){
fill(0, 200, 0, 204); textSize(32); text(timer, 10, 250); }
else{
fill(200, 0, 0, 204); textSize(32); text(timer, 10, 250);}
  }
}