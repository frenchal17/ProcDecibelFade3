import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup(){
  size(500,500, P2D);
  background(220,220,220);
  
  minim = new Minim(this);
      player = minim.loadFile("/Users/alexfrench/Desktop/proc/05 Never Mess With Sunday.mp3", 2048);
 // player = minim.loadFile("/Users/alexfrench/Desktop/proc/08 Warning Sign.mp3", 2048);
 // player = minim.loadFile("/Users/alexfrench/Desktop/proc/Spitfire _Original Mix_ - Porter Robinson _HD_.mp3", 2048);
 //  player = minim.loadFile("/Users/alexfrench/Desktop/proc/Wonder.mp3", 2048);
 //player = minim.loadFile("/Users/alexfrench/Desktop/proc/01 Be Ok.mp3", 2048);
// player = minim.loadFile("/Users/alexfrench/Desktop/proc/Stars.mp3", 2048);
 //  player = minim.loadFile("/Users/alexfrench/Desktop/proc/Back to the Beginning.mp3", 2048);
  player.play();
}

  //From Figure 8
  float center1, center2;
  float x2 = 0;
  float y2 = 0;
  float c2 = .006;
  //End figure 8
  float x = 0;
  float y = 0;
  float z = 2 * PI;
  float c = .006956525;
  float z2 = 0;
  float z3 = PI/100;
  float r = 59;
  float BPM = 120;
  float calc2 = BPM / 4;
  float calc3 = calc2 / 2;
  float r2 = 0;
  
  
//Azure -- Paul Kalkbrenner = 123 BPM? Maybe 
//Replica -- Original Mix by Afrojack
//Changed program into 4 revs/minute
//105 BPM for Disco Science by Mirwais
//Don't forget, c = .006956525;
void draw(){
  x = x + c;
  y = y + c;
  x2 += c2;
  y2 += c2;
  center1 = 300 + 180 * sin(x2) * cos(x2);
  center2 = 300 + 180 * sin(y2);
  //background(201,200,200);
  fill(220,10);
  rect(-5,-5,width + 5,height + 5);
  for(int i = 0; i < player.left.size()-1; i++)
  {
  line(center1, center2,
       center1 + ((player.left.get(i)*700) * sin(x)),
       center2 + ((player.right.get(i)*700) * sin(y)));
  line(center1, center2,
       center1 - ((player.left.get(i)*700) * sin(x)),
       center2 + ((player.right.get(i)*700) * sin(y)));
  }
  
 /* if (x > z){
       background(201,200,200);
       z = z + 2 * PI;
  }*/
  
//Colored!
  if (x > z2){
    z2 = z2 + PI/calc3;
    r2 = random(0,150);
    stroke(r2,r2,r2);
    //r = random(100, 250);
  }
  
  //if (x > z3){
   // z3 = z3 + PI/calc3;
   // stroke(0,0,0);
   // r = 100;
  //}
  
}

void keyPressed(){
  if (key == 's'){
    saveFrame("####.png");
  }
}

void stop()
{
  player.close();
  minim.stop();
  
  super.stop();
}

//128 BPM.
//4 cycles per minute
//8 beats per cycle at this point (with PI/4)
//Thus, beats per cycle should be double the denom of PI
//27.5 BPC needed for 110 BPM; PI/13.75
//32 BPC needed for 128 BPM; PI/16 should work.
//34.5 BPC needed for 138 BPM; PI/17.25
//35 BPC needed for 140; PI/17.5
//Holy crap, there are a lot of songs that have 128 as their BPM!!!
