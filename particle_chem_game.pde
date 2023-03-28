float nucleusRadius = 500;
float nucleusOffset = 50;
//Particle particle;
//Particle[] particles;
//Particle nucleus;
void setup() {
  //nucleusRadius = ((width < height)? width : height) * 0.20;
  //nucleus = new Particle(width/2, height/2, color(255, 255, 255, 125), 0, nucleusRadius * 2);
  //initParticles();
  //particle = new Particle(width/2, height/2, getRandomColor(),0);
  //size(1280, 720);
  frameRate(60);
  fullScreen();
}
void draw() {
  background(20);
  //nucleus();
  //for (Particle particle : particles) {
  //  particle.show();
  //  particle.updatePos();
  //}
  //handleMouseHold();
  //nucleus.updateFramePos();
  renderInfo();
}
void renderInfo() {
  fill(255);
  noStroke();
  textSize(50);
  text(""+int(frameRate), 20, 50);
  //text("Nucleus("+nucleus.x+", "+nucleus.y+")", 20, 100);
  //text("Particels: "+particles.length, 20, 150);
}
color getRandomColor() {
  return color(
    getRandomColorScale(), // r
    getRandomColorScale(), // g
    getRandomColorScale()  // b
    );
}
float getRandomColorScale() {
  return map(random(1), 0, 1, 125, 255);
}
//void nucleus() {
//  noStroke();
//  fill(255, 255, 255, 125);
//  circle(nucleus.x, nucleus.y, nucleus.particleSize);
//}
//void initParticles() {
//  particles = new Particle[10];
//  for (int a = 0; a < particles.length; a++)
//    particles[a] = new Particle((360/particles.length) * a, 40);
//}
//void handleMouseHold() {
//  if (mousePressed) {
//    nucleus.x = mouseX;
//    nucleus.y = mouseY;
//  }
//}
