abstract class Particle {
  PVector origin;
  PVector vel = new PVector(10, 10);
  float particleSize;
  color particleColor;
  float angle;
  float offsetAngle;
  float nucelusOffsetAngle;
  Particle(float nucleusX, float nucleusY, float offsetAngle, float particleSize) {
    this.origin = new PVector(nucleusX, nucleusY);
    this.particleColor = color(0, 0, 255);
    this.angle = 0;
    this.offsetAngle = offsetAngle;
    this.nucelusOffsetAngle = 0;
    this.particleSize = particleSize;
  }
  Particle(float x, float y, color particleColor, float offsetAngle, float particleSize) {
    this.origin = new PVector(x, y);
    this.particleColor = particleColor;
    this.particleSize = particleSize;
    this.angle = 0;
    this.offsetAngle = offsetAngle;
    this.nucelusOffsetAngle = 0;
  }
  void show(float nucleusRadius, float nucleusOffset) {
    float posX = this.origin.x + (nucleusRadius * sin(radians(this.angle + this.offsetAngle)));
    float posY = this.origin.y + (nucleusRadius * cos(radians(this.angle + this.offsetAngle)));

    // Calculating the offsets
    float offset =  (nucleusOffset * sin(radians(this.nucelusOffsetAngle)));

    // rendering the circle
    noStroke();
    fill(this.particleColor, 100);
    circle(
      posX + offset, // Addddding offfffset
      posY + offset, // Addddding offfffset
      particleSize );
  }
  void updatePos(float nucleusX, float nucleusY) {
    this.origin.x = nucleusX;
    this.origin.y = nucleusY;
    angle+= random(2, 5);
    nucelusOffsetAngle += random(0.1, 5);
    if (angle >= 360 || angle <= 360)
      angle %= 360;
    if (nucelusOffsetAngle >= 360 || nucelusOffsetAngle <= 360)
      nucelusOffsetAngle %= 360;
  }

  void updateFramePos() {
    this.origin.add(vel);
    if (this.origin.x - particleSize/2 <= 0 || this.origin.x + particleSize/2 >= width)
      this.vel.x *= -1;
    if (this.origin.y - particleSize/2 <= 0 || this.origin.y + particleSize/2 >= height)
      this.vel.y *= -1;
  }
}
