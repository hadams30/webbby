/* @pjs preload="download.jpg,download-1.jpg";*/
//look in webby folder for the rest of the pjs directives

interface JavaScript{
}
void bindJavascript(Javascript js){
  javascript=js;
}

Letters[] letterArray=new Letters[10];
String[] LETTER= new String[10];
Float[] LEXXER= new Float[10];
Float[] LEYYER= new Float[10];
PImage pic1, pic2;
float xpic1, xpic2;
float easing= 0.01;
JavaScript javascript;

void setup(){
 size(600,300);
 pic1=loadImage("download.jpg");
 pic2=loadImage("download-1.jpg");
 
 //filling arrays
 LEXXER[0]=100.0;
 LEXXER[1]=150.0;
 LEXXER[2]=200.0;
 LEXXER[3]=250.0;
 LEXXER[4]=300.0;
 LEXXER[5]=300.0;
 LEXXER[6]=350.0;
 LEXXER[7]=400.0;
 LEXXER[8]=450.0;
 LEXXER[9]=500.0;
 
 for(int i=0; i<5; i=i+1){
 LEYYER[i]= 120.0;
 }
 for(int i=5; i<10; i=i+1){
 LEYYER[i]= 170.0;
 }
 
 LETTER[0]="H";
 LETTER[1]="O";
 LETTER[2]="L";
 LETTER[3]="L";
 LETTER[4]="Y";
 LETTER[5]="A";
 LETTER[6]="D";
 LETTER[7]="A";
 LETTER[8]="M";
 LETTER[9]="S";
 
  
 for(int i=0; i<5; i++){
   letterArray[i]=new Letters(LETTER[i], LEXXER[i], LEYYER[i],1);
 }
 for(int i=5; i<10; i++){
   letterArray[i]=new Letters(LETTER[i], LEXXER[i], LEYYER[i],-1);
 }
 
}//END OF SETUP

void draw(){
  pic1.resize(0,300);
  pic2.resize(0,300);
  tint(255, 127);
  background(255);
  float targetX1, targetX2;
  float d= dist(mouseX,0,300,0);
  targetX1= 100+d;
  targetX2= 100+d;
  float dx1= targetX1-xpic1;
  xpic1 += dx1 *easing;
  float dx2= targetX2-xpic2;
  xpic2 += dx2*easing;
  image(pic1,600-xpic1,0);
  image(pic2,xpic2,0);
  
  for(int i=0; i<10; i=i+1){
  letterArray[i].moveletters();
  letterArray[i].setletters();
  }
}//end of draw





//STARTING LETTER MOVEMENT CLASSES
class Letters{
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  String lttr;
  float targX;
  float targY;
  int direction;
  
  Letters(String _lttr, float _targX, float _targY, int _direction){
    lttr=_lttr;
    targX=_targX;
    targY=_targY;
    direction=_direction;
  }
  
  void moveletters(){
    float targetX=targX+(direction*mouseX);
    float dx= targetX-xpos;
    xpos+=dx*easing;
    ypos=targY;
  }
  
  void setletters(){
    textAlign(CENTER,CENTER);
    textSize(40);
    fill(165,27,27);
    text(lttr,xpos,ypos);
  }
  
  
  
  
  
  
}//end of letters class