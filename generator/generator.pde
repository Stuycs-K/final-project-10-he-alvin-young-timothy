PImage img;

void setup() {
  size(400, 400);
  img = createImage(width, height, RGB);
  img.loadPixels();
}

void draw() {
  background(255);
  fill(255, 0, 0); 
  textSize(30);
  text("hello", width/2, height/2);
  img = get();
  image(img, 0, 0);
  save("red_text.png");
}
