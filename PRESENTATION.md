## PRESENTATION.md

## Steganography: A Brief History

Although cryptography and encryptions have been around since medieval times, steganography takes a different approach to this idea of encoded messages by making the hidden message itself discreet. Although encryption merely ensures the security of the hidden message, steganography relies more upon the theory of hiding in plain sent, obscuring the fact that the message itself has been sent by the human brain's amazing ability to filter seemingly irrelevant information. The term steganography, or the art of hiding messages within mediums in plain sight, was first used in 1499 by German abbot Johannes Trithemius, the father of cryptography and steganography. In his Steganographia, he detailed these principles using shopping lists and letters as ruses to cover the messages written in invisible ink between the margins. 

However, Kurak and McHugh are the first to propose the idea of digital steganography. With the turn of the digital age, they argued that three main factors set steganography apart; its ability to remain undetected, robustness(resistance to decryption through various image processing techniques), and capacity of message. They experimented with image downgrading and image contamination, quite resembling our LSB encryption lab in Processing!

Steganography Applications:

Besides the form of LSB Steganography that we've been acquainted with.

### Color Planes and Differences between ARGB Planes
We created our project using Processing, and we decided upon the PNG format because it allows for lossless conversion, ensuring that our encoded image will not lose acuity despite the number of times we encode and save our image. In Processing, images are initialized with their specific dimensions and with RGB channels(alpha channel ignored) or with ARGB(with transparency mode included). As we loop through each pixel in the pixel[] of the target image, we can access these RGB channels for each specific pixel. A color value of (0,0,0) indicates a black pixel, whereas (255,255,255) indicates white, with each value dictating how much of each primary color comprises the pixel's color. 

As these values range from 0-255, it is easy to decompose them into binary in the form of 8 bits that can enumerate any value within our range. Stegsolve uses eight total color planes for each color (r,g,b), in which one is the base color, and the other 7 planes are variations. The way that the color channels work is that if the color's nth bit from the right is equal to one, that pixel will appear as white in that specified plane. On the other hand, if the nth bit from the right is equal to zero, the pixel will appear as black on the specified plane. 


## XOR 
XOR, or exclusive OR, works exceptionally well in binary situations. Binary operates in base 2, using only zeroes and ones. By looking and comparing each place of our original binary and a encoding binary, XOR will return 1 if the two values differ(0 and 1), and false if the two values are the same (0,0) or (1,1). 

//Insert XOR Example HERE:
Take, for instance, this binary sequence, which will be our "key".
```01010111010111101010```

Let's say this is the message we want to encode:
```01110100010101110111```

Here they are side by side: 
```01010111010111101010```
```01110100010101110111```

When we xor them together, we get:
```00100011000010011101```

And the best part is that applying the xor method to the encoded string and the key once more reveals the message!
However, xor has multiple applications. In the photography industry, xor results in a photo negative! In fact, xor is one of the color filters in which a secret message can be hidden. 

## Encryption Technique (Using LSB and XOR)

For our encoder, we masked text into specific bits of an image so that the text is only visible through Stegsolve planes. 
To mask text into an image, the encoder pastes text onto an image and saves it as edited.png and then compares that image to the original to produce hidden.png. 
hidden.png is just a combination of both original.png and edited.png but with the different pixels between the two slightly altered into the original through bit operations.

Each pixel's color channel value ranges from 0 to 255, corresponding to 8 bits. By turning on and off these bits, we control which planes reveal the encoded information. For example, setting the rightmost bit (the least significant) to 1 would paint that pixel black on that plane in Stegsolve. If that bit were 0, it would be painted white. As the bits get more significant (from left to right), the color becomes less sharp and the image becomes more visually distorted.

Example: a pixel with bits: <br/>

```00000001``` would only appear on plane 0 <br/> `rgb(2, 0, 0)`
```00000100``` would only appear on plane 2 <br/> `rgb(8, 0, 0)`
```00101010``` would appear on planes 1,3,5 <br/> `rgb(4, 0, 0)`
```11111111``` would show up on all planes <br/>  `rgb(255, 0, 0)`
`rgb(9, 105, 218)`

## Instructions

Our program is comprised of an image encoder and generator, which work in conjunction to encode a message within four different color modes and seven different planes. By checking our modified images with Stegsolve, we ensured that our program worked properly in realistic situations. This involved heavy research into the ways in which Stegsolve treats and attempts to break these forms of encryptions. 

Before running anything, make sure you have Stegsolve installed (get it [here](https://wiki.bi0s.in/steganography/stegsolve/)) in a location you can access
- to run stegsolve, open the terminal and navigate to the directory where Stegsolve is installed in
- then run ```java -jar Stegsolve.jar``` and open the image in the pop up interface

Generator: after running, a 400x400 blank white image with text on top is produced

Encoder: after inserting the image and the text to hide in the image, run to get original.png (the original image), edited.png (the original image with text on top), and hidden.png (the original image with the text hidden in pixels)
- pressing the key x changes the mode between ENCODE (hides text in the image) and XOR (inverts the image)
- pressing the key f changes the background between BLANK (white background with text) and FILL (actual image with text)
- pressing the key m changes the edited image from text to marks
- pressing the keys r, g, or b changes the plane color (between RED, GREEN, and BLUE respectively) being encoded and the hidden.png being produced
- pressing the keys 0 through 7 changes the plane number being 
- pressing ENTER changes the displayed image between original.png, edited.png, and hidden.png

After running the encoder, open up Stegsolve and open hidden.png and cycle through the planes until you find your hidden message!

To recap:

- [ ] Install stegsolve 🦖
- [ ] Using `generator.pde`, generate your desired text upon a white background 🖋️
- [ ] With your generated image from `encoder.pde`, create three images: the original, the edited version, and the hidden version 🖼️
- [ ] Utilize key binds to cycle between the modes for encryption: 0-7 changes the encryption plane, and ENTER swaps between your images 🔃
- [ ] Place your hidden image into stegsolve to watch your message appear before your very eyes 👀
- [ ] Have fun! :tada:

Sources:
https://www.sciencedirect.com/science/article/abs/pii/S0165168409003648
Image Downgrading: https://www.petitcolas.net/steganography/image_downgrading/

Proposed Idea: Use image steganography on some of the image we include in the README
