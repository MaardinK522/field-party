class Electron {
  PVector origin;
  PVector pos;
  float particleSize;
  color particleColor;
  float angle = 0;
  float shellOffset;
  float updateDir = 0;
  Electron(float nucleusX, float nucleusY, float offsetAngle, float particleSize, float shellOffset) {
    this.origin = new PVector(nucleusX, nucleusY);
    this.pos = new PVector();
    this.particleColor = color(0, 0, 255);
    this.angle += offsetAngle;
    this.particleSize = particleSize;
    this.shellOffset = shellOffset;
    this.updateDir = (random(0.5) < 1)? 1 : -1;
  }
  void show() {
    noStroke();
    fill(this.particleColor, 100);
    circle(this.pos.x, this.pos.y, particleSize);
  }
  void update(float nucleusX, float nucleusY) {
    this.origin.x = nucleusX;
    this.origin.y = nucleusY;
    angle += updateDir;
    if (angle >= 360 || angle <= 360)
      angle %= 360;
    this.pos.x = this.origin.x + (this.shellOffset * sin(radians(this.angle)));
    this.pos.y = this.origin.y + (this.shellOffset * cos(radians(this.angle)));
  }
  @Override
    String toString() {
    return "\t\nElectron("+this.origin.x+", "+this.origin.y+", angleOffset: "+this.angle+", shellOffset: "+this.shellOffset+")";
  }
}
