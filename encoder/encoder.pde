PImage original, edited, hidden;

int XOR = 0;
int ENCODE = 1;
int DECODE = 2;

int RED = 0;
int GREEN = 1;
int BLUE = 2;
int ALPH = 3;

int BLANK = 0;
int FILL = 1;

int ORIGINAL = 0;
int EDITED = 1;
int HIDDEN = 2;
int DISPLAY = ORIGINAL;

int MODE = ENCODE;
int COLOR = RED;
int PLANE = 0;
int BACKGROUND = FILL;
String MESSAGE = "Johannes Vermeer (1665)";

int MARKED = 0;

void setup() {
  size(800, 947);
  String img;
  if (BACKGROUND == BLANK){
    img = "generated.png";
  } 
  else {
    img = "pearl.png"; 
  }
  original = loadImage(img);
  image(original, 0, 0);
  save("original.png");
  edited = loadImage(img);
  hidden = loadImage(img);
  if (MODE == XOR) {
    edited.loadPixels();
    for (int i = 0; i < edited.pixels.length; i++) {
      edited.pixels[i] = color(255);
    }
    edited.updatePixels();
    image(edited, 0, 0);
    save("edited.png");
    isXOR(original, edited, hidden);
  } 
  else if (MODE == ENCODE) { 
    if (BACKGROUND == BLANK) {
      encodeBlank(original, hidden);
    } 
    else if (BACKGROUND == FILL) {
      encodeFill(original, edited, hidden);
    }
  }
  image(hidden, 0, 0);
  save("hidden.png");
}

void encodeBlank(PImage original, PImage hidden) {
  hidden.loadPixels();
  for (int i = 0; i < original.pixels.length; i++) {
    int c = original.pixels[i];
    int r = (int)red(c);
    int g = (int)green(c);
    int b = (int)blue(c);
    if (r == 255 && g == 255 && b == 255) { 
      hidden.pixels[i] = color(0, 0, 0, 255);
    } 
    else {
      if (COLOR == RED) {
        hidden.pixels[i] = color((int)Math.pow(2, PLANE), 0, 0, alpha(c));
      } 
      else if (COLOR == GREEN) {
        hidden.pixels[i] = color(0, (int)Math.pow(2, PLANE), 0, alpha(c));
      } 
      else if (COLOR == BLUE) {
        hidden.pixels[i] = color(0, 0, (int)Math.pow(2, PLANE), alpha(c));
      } 
      else if (COLOR == ALPH) {
        hidden.pixels[i] = color(0, 0, 0, (int)Math.pow(2, PLANE));
      }
    }
  }
  hidden.updatePixels();
}

void encodeFill(PImage original, PImage edited, PImage hidden) {
  if (MARKED == 1){
    edited = loadImage("marked.png");
  } 
  else{
    fill(0, 255, 255, 254); 
    textSize(50);
    textAlign(CENTER, CENTER);
    text(MESSAGE, width/2, height/2);
    edited = get(); 
  }
  image(edited, 0, 0);
  save("edited.png");
  for (int i = 0; i < original.pixels.length; i++) {
    int c = original.pixels[i];
    int a = (int)alpha(c);
    int r = (int)red(c);
    int g = (int)green(c);
    int b = (int)blue(c);
    int c2 = edited.pixels[i];
    int a2 = (int)alpha(c2);
    int r2 = (int)red(c2);
    int g2 = (int)green(c2);
    int b2 = (int)blue(c2);
    if (c != c2) {
      a = 254;
    }
    if (COLOR == RED) {
      if (r2 != r && (r2&(int)Math.pow(2,PLANE)) == 0) {
        r += (int)Math.pow(2,PLANE);
      }
      if ((r2&(int)Math.pow(2,PLANE)) != 0) {
        r -= (int)Math.pow(2,PLANE);  
      }
    } 
    else if (COLOR == GREEN) {
      if (g2 != g && (g2&(int)Math.pow(2,PLANE)) == 0) {
        g += (int)Math.pow(2,PLANE);
      } 
      else if ((g2&(int)Math.pow(2,PLANE)) != 0) {
        g -= (int)Math.pow(2,PLANE);  
      }
    } 
    else if (COLOR == BLUE) {
      if (b2 != b && (b2&(int)Math.pow(2,PLANE)) == 0) {
        b += (int)Math.pow(2,PLANE);
      } 
      else if ((b2&(int)Math.pow(2,PLANE)) != 0) {
        b -= (int)Math.pow(2,PLANE);  
      }
    } 
    else if (COLOR == ALPH) {
      if (c2 != c && (a2 & (int)Math.pow(2, PLANE)) == 0) {
        a += (int)Math.pow(2, PLANE);
      } 
      else if ((a2 & (int)Math.pow(2, PLANE)) != 0) {
        a -= (int)Math.pow(2, PLANE);
      }
    }
    hidden.pixels[i] = color(r, g, b, a);
  }
  hidden.updatePixels();
}

void draw() {
  PImage original = loadImage("original.png");
  PImage edited = loadImage("edited.png");
  PImage hidden = loadImage("hidden.png");
  textSize(40);
  fill(255);
  String display = "";
  String colour = "";
  String mode = "";
  if (BACKGROUND == BLANK && MODE == ENCODE) {
    fill(150);
    edited = original;
  }
  if (DISPLAY == ORIGINAL) {
    display += "original";
    image(original, 0, 0);
  } 
  else if (DISPLAY == EDITED) {
    if (MODE == XOR) {
      fill(0);
    }
    display += "edited";
    image(edited, 0, 0);
  } 
  else if (DISPLAY == HIDDEN) {
    display += "hidden";
    image(hidden, 0, 0);
  }
  if (MODE == ENCODE) {
    mode += "encode";
    if (COLOR == RED) {
      colour += "red";
    } 
    else if (COLOR == GREEN) {
      colour += "green";
    } 
    else if (COLOR == BLUE) {
      colour += "blue";
    } 
    else if (COLOR == ALPH) {
      colour += "alpha";
    }
    if (BACKGROUND == BLANK) {
      mode += " (blank)";
    } 
    else {
      mode += " (fill)";
    }
  } 
  else {
    mode += "xor";
  }
  textAlign(LEFT);
  text("mode: " + mode, 20, 40);
  text("display: " + display, 20, 80);
  if (MODE == ENCODE) {
    text("color: " + colour, 20, 120);
    text("plane: " + PLANE, 20, 160);
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    COLOR = RED;
  } 
  else if (key == 'g' || key == 'G') {
    COLOR = GREEN;
  } 
  else if (key == 'b' || key == 'B') {
    COLOR = BLUE;
  } 
  else if (key == 'a' || key == 'A') {
    COLOR = ALPH;
  } 
  else if (key == 'f' || key == 'F') {
    BACKGROUND ++;
    BACKGROUND %= 2;
  } 
  else if (key == 'x' || key == 'X') {
    MODE ++;
    MODE %= 2;
  } 
  else if (key == 'm' || key == 'M') {
    MARKED++;
    MARKED %= 2; 
  } 
  else if (key >= '0' && key <= '7') {
    PLANE = (int)(key - '0');
  } 
  else if (key == ENTER) {
    DISPLAY++;
    DISPLAY %= 3; 
  }
  setup();
}

boolean isXOR(PImage img1, PImage img2, PImage modified) {
  if(img1.width != img2.width && img1.height != img2.height) {
    return false;
  } 
  else {
    for(int index = 0; index < img1.pixels.length; index++) {
      modified.pixels[index] = img1.pixels[index] ^ img2.pixels[index];
    }
  }
  modified.updatePixels();
  return true;
}
