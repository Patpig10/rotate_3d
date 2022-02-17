import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


Minim minim;
  AudioPlayer ap;
  AudioInput ai;
  AudioBuffer ab;
void setup()
{
size(1000,1000,P3D);
 minim = new Minim(this);
//ai = minim.getLineIn(Minim.MONO,1024,44100,16);
ap = minim.loadFile("nightcore_beethoven_virus_9AVkB3MByoK-gucZO7lZ.mp3",1024);

ab = ap.mix;
ap.play();
//ab = ai.mix;

}
float lerpedAverage = 0;
float theta;
float speed = 0;
float z = 0;
void draw()
{
  float total = 0;
    for(int i = 0; i < ab.size(); i++)
{
  total += abs(ab.get(i));
}
float average = total / (float) ab.size();
  background(0);
 stroke(255);
  //noStroke();
  strokeWeight(2);
  noFill();
  //fill(255);
  lights();
  pushMatrix();
  translate(width*.22,height/2,z);
rotateY(theta);//(HALF_PI);//TWO_PI,QUARER_PI
float size =map(lerpedAverage,0,1,100,500);
  lerpedAverage = lerp(lerpedAverage,average,0.1f);

 rotateX(theta);
  rotateZ(theta);
  
  box(size);
  
  
  popMatrix();
  translate(width*.70,height/2,z);
  rotateY(theta);//(HALF_PI);//TWO_PI,QUARER_PI
  rotateX(theta);
 rotateZ(theta);
  box(size);
  //theta +=0.01f;
//  z -= 10;
  theta += speed;
  speed = map(mouseX,0,width,0,0.1f);
}
