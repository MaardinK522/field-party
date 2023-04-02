import java.util.*;
class Atom {
  Electron[] electrons;
  PVector pos;
  PVector vel;
  String atomTag;
  float atomSize = 100;
  float electronSize = 0;
  float electronOffset;
  ArrayList<Integer> shell;
  Atom(float x, float y, int electronCount, int electronSize, String atomTag, float electronOffset) {
    this.pos = new PVector(x, y);
    this.vel = new PVector(random(-1, 1), random(-1, 1));
    this.atomTag = atomTag;
    this.electrons = new Electron[electronCount];
    this.electronSize = electronSize;
    this.electronOffset = electronOffset;
    this.shell = new ArrayList();
    // calculating arrangement
    int n = 1;
    println("Electron count: " + electronCount);
    while (electronCount >= 2 * n * n) {
      shell.add(2 * n * n);
      electronCount -= 2 * n * n;
      n++;
    }
    if (electronCount !=0)
      shell.add(electronCount);
    // initializing the electrons
    int e = 0;
    for (int a = 0; a < shell.size(); a++) {
      int eNum = shell.get(a);
      float angleOffset = 360 / eNum;
      for (int b = 0; b < eNum; b++) {
        electrons[e] = new Electron(this.pos.x, this.pos.y, angleOffset * b, this.electronSize, this.electronOffset * (a + 1));
        println(electrons[e]);
        e++;
      }
    }
  }
  void show() {
    showParticles();
    // Element name
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text(this.electrons.length, this.pos.x, this.pos.y + 20);
    text(this.atomTag, this.pos.x, this.pos.y - 5);
  }
  void showParticles() {
    for (Electron electron : electrons) {
      stroke(255);
      electron.show();
      electron.update(this.pos.x, this.pos.y);
    }
  }
  void showShells() {
    for (int a =  shell.size(); a >= 1; a--) {
      float shellOffset = this.electronOffset * a * 2;
      fill(background, background);
      stroke(255);
      circle(this.pos.x, this.pos.y, shellOffset);
    }
  }
  void update(float worldWidth, float worldHeight) {
    this.pos.add(vel);
    float outterBounding = this.shell.size() * electronOffset;
    // Bounding
    if (this.pos.x - outterBounding <= 0 || this.pos.x + outterBounding >= worldWidth)
      this.vel.x *= -1;
    if (this.pos.y - outterBounding <= 0 || this.pos.y + outterBounding >= worldHeight)
      this.vel.y *= -1;
  }
  @Override
    String toString() {
    return "Atom{"+this.pos.x+", "+this.pos.y+",\nElectrons: "+Arrays.toString(this.electrons)+"}";
  }
}
