int background = 20;
World world;
PVector worldDim;
void settings() {
  fullScreen(P2D, 1);
}
void setup() {
  worldDim = new PVector(512, 512);
  world = new World(new PVector((width - 512) / 2, (height - 512) / 2), new PVector((width + 512) / 2, (height + 512) / 2), int(random(5)));
  frameRate(120);
}
void draw() {
  background(background);
  world.renderWorld();
  world.renderAtoms();
  world.updateAtoms();
  renderInfo();
}
void renderInfo() {
  fill(255);
  noStroke();
  textSize(50);
  text(""+int(frameRate), 40, 50);
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
