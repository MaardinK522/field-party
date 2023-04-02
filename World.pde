class World {
  private PVector origin;
  private PVector dim;
  float worldBorderWidth = 10;
  Table periodicTable;
  float electronOffset = 20;
  Atom[] atoms;
  World(PVector origin, PVector dim, int atomCount) {
    this.origin = origin;
    this.dim = new PVector(dim.x, dim.y);
    println(this.dim);
    this.periodicTable = loadTable("elements.csv", "header");
    atoms = new Atom[atomCount];
    for (int a = 0; a < atoms.length; a++) {
      int electronCount = int(random(50, 90));
      float x = random(this.origin.x + getAtomWidth(electronCount) + 10, this.dim.x - getAtomWidth(electronCount));
      float y = random(this.origin.x + getAtomWidth(electronCount), this.dim.y - getAtomWidth(electronCount));
      atoms[a] = new Atom(x, y, electronCount, 20, getAtomName(electronCount), electronOffset);
      //println((a+1)+": "+atoms[a]);
    }
  }
  void renderWorld() {
    strokeWeight(worldBorderWidth);
    stroke(255);
    // Top
    line(this.origin.x + (worldBorderWidth / 2), this.origin.y + (worldBorderWidth / 2), this.dim.x - (worldBorderWidth / 2), this.origin.y + (worldBorderWidth / 2));
    // Bottom
    line(this.origin.x + (worldBorderWidth / 2), this.dim.y - (worldBorderWidth / 2), this.dim.x - (worldBorderWidth / 2), this.dim.y - (worldBorderWidth / 2));
    // Right
    line(this.dim.x - (worldBorderWidth / 2), this.origin.y + (worldBorderWidth / 2), this.dim.x - (worldBorderWidth / 2), this.dim.y - (worldBorderWidth / 2));
    // Left
    line(this.origin.x + (worldBorderWidth / 2), this.origin.y + (worldBorderWidth / 2), this.origin.x + (worldBorderWidth / 2), this.dim.y - (worldBorderWidth / 2));
  }
  void renderAtoms() {
    for (Atom atom : atoms)
      atom.show();
  }
  void updateAtoms() {
    for (Atom atom : atoms)
      atom.update(this.dim.x - worldBorderWidth, this.dim.y - worldBorderWidth);
  }
  String getAtomName(int atomCount) {
    for (TableRow elementRow : periodicTable.rows()) {
      if (atomCount == elementRow.getInt("atomicNumber")) {
        return elementRow.getString("symbol");
      }
    }
    return "NULL";
  }
  Atom getRandomAtom(PVector dim) {
    int electronCount = int(random(10, 50));
    Atom atom = new Atom(random(dim.x), random(dim.y), electronCount, 20, getAtomName(electronCount), this.electronOffset);
    return atom;
  }
  float getAtomWidth(int electronCount) {
    int n = 1;
    println("Electron count: " + electronCount);
    while (electronCount >= 2 * n * n) {
      electronCount -= 2 * n * n;
      n++;
    }
    return 2 * n * n;
  }
}
