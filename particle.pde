class Particle {
  float x;
  float y;
  float particleSize;
  color particleColor;
  float angle;
  float offsetAngle;
  float nucelusOffsetAngle;
  float xVel = 10;
  float yVel = 10;
  Particle(float offsetAngle, float particleSize) {
    this.x = nucleus.x;
    this.y = nucleus.y;
    this.particleColor = color(0, 0, 255);
    this.angle = 0;
    this.offsetAngle = offsetAngle;
    this.nucelusOffsetAngle = 0;
    this.particleSize = particleSize;
  }
  Particle(float x, float y, color particleColor, float offsetAngle, float particleSize) {
    this.x = x;
    this.y = y;
    this.particleColor = particleColor;
    this.particleSize = particleSize;
    this.angle = 0;
    this.offsetAngle = offsetAngle;
    this.nucelusOffsetAngle = 0;
  }
  void show() {
    float posX = this.x + (nucleusRadius * sin(radians(this.angle + this.offsetAngle)));
    float posY = this.y + (nucleusRadius * cos(radians(this.angle + this.offsetAngle)));
    // add the offsets
    float xOffset =  (nucleusOffset * sin(radians(this.nucelusOffsetAngle)));
    float yOffset =  (nucleusOffset * cos(radians(this.nucelusOffsetAngle)));

    // Adddddding Randomnessss to offfffffsets
    float offset =  noise(0.1, 0.1) * nucleusOffset;
    if (random(1) < 0.5) xOffset += offset;
    else                 yOffset += offset;

    // rendering the circle
    noStroke();
    fill(this.particleColor, 125);
    circle(
      posX + xOffset, // Addddding X offfffset
      posY + yOffset, // Addddding Y offfffset
      particleSize );
  }
  void updatePos() {
    this.x = nucleus.x;
    this.y = nucleus.y;
    angle+= random(2, 5);
    nucelusOffsetAngle += random(10, 30);
    if (angle >= 360 || angle <= 360)
      angle %= 360;
    if (nucelusOffsetAngle >= 360 || nucelusOffsetAngle <= 360)
      nucelusOffsetAngle %= 360;
  }
  void updateFramePos() {
    this.x += this.xVel;
    this.y += this.yVel;

    if (this.x - particleSize/2 <= 0 || this.x + particleSize/2 >= width)
      this.xVel *= -1;
    if (this.y - particleSize/2 <= 0 || this.y + particleSize/2 >= height)
      this.yVel *= -1;
  }
}
