class Atom {
  float x;
  float y;
  float xVel;
  float yVel;
  float atomSize;
  float atomColor;
  Particle[] particles;
  Atom(float x, float y, float atomSize, color atomColor, int particleNum) {
    this.x = x;
    this.y = y;
    this.xVel = 1;
    this.yVel = 1;
    this.atomSize = atomSize;
    this.atomColor = atomColor;
    particles = new Particle[particleNum];
    for (int a = 0; a < particles.length; a++)
      particles[a] = new Particle((360/particles.length) * a, 40);
  }
  void show() {
    noStroke();
    fill(atomColor, 200);
    circle(this.x, this.y, this.atomSize);
  }
  void showParticles() {
    for (Particle particle : particles) {
      particle.show();
      particle.updatePos();
    }
  }
  void update() {
    this.x += this.xVel;
    this.y += this.yVel;
    // Bouding boundaries
    if (this.x - atomSize/2 <= 0 || this.x + atomSize/2 >= width)
      this.xVel *= -1;
    if (this.y - atomSize/2 <= 0 || this.y + atomSize/2 >= height)
      this.yVel *= -1;
  }
}
