[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/ecp4su41)
# THIS DOCUMENT IS REQUIRED

## Group Info
Alvin He, Timothy Young
Period 10

## Overview

## Steganography: A Brief History

Although cryptography and encryptions have been around since medieval times, steganography takes a different approach to this idea of encoded messages by making the hidden message itself discreet. Although encryption merely ensures the security of the hidden message, steganography relies more upon the theory of hiding in plain sent, obscuring the fact that the message itself has been sent by the human brain's amazing ability to filter seemingly irrelevant information. The term steganography, or the art of hiding messages within mediums in plain sight, was first used in 1499 by German abbot Johannes Trithemius, the father of cryptography and steganography. In his Steganographia, he detailed these principles using shopping lists and letters as ruses to cover the messages written in invisible ink between the margins. 

However, Kurak and McHugh are the first to propose the idea of digital steganography. With the turn of the digital age, they argued that three main factors set steganography apart; it's ability to remain undetected, robustness(resistance to decryption through various image processing techniques), and capacity of message. They experimented with image downgrading and image contamination, quite resembling our LSB encryption lab in Processing!

Steganography Applications:

Steganography Methods: GIF, JPEG, PNG
Besides the form of LSB Steganography that we've been acquainted with.

### Color Planes and Differences between ARGB Planes
We created our project using Processing, and we decided upon the PNG format because it allows for lossless conversion, ensuring that our encoded image will not lose acuity despite the number of times we encode and save our image, unlike JPEG. In Processing, images are initialized with their specific dimensions and with RGB channels(alpha channel ignored) or with ARGB(with transparency mode included). As we loop through each pixel in the pixel[] of the target image, we can access these RGB channels for each specific pixel. A color value of (0,0,0) indicates a black pixel, whereas (255,255,255) indicates white, with each value dictating how much of each primary color comprises the pixel's color. 

As these values range from 0-255, it is easy to decompose them into binary in the form of 8 bits that can enumerate any value within our range. Stegsolve uses eight total color planes for each color (r,g,b), in which one is the base color, and the other 7 planes are variations. The way that the color channels work is that if the color's nth bit from the right is equal to one, that pixel will appear as white in that specified plane. On the other hand, if the nth bit from the right is equal to zero, the pixel will appear as black on the specified plane. 

Alpha, on the other hand, 


## XOR 
XOR, or exclusive OR, works exceptionally well in binary situations. Binary operates in base 2, using only zeroes and ones. By looking and comparing each place of our original binary and a encoding binary, XOR will return 1 if the two values differ(0 and 1), and false if the two values are the same (0,0) or (1,1). 

//Insert XOR Example HERE:
Take, for instance, this binary sequence, which will be our "key".

Now, if we xor it with the message string:
```010101010101011101010```


Here they are side by side: 
```01010101010111101010```
```010101010101011101010```

We get:

And the best part is that applying the xor method to the encoded string and the key once more reveals the message!
However, xor has multiple applications. In the photography industry, xor results in a photo negative! In our scenario, we use xor on an original image and a image with text to detect hidden portions within 

## Encryption Technique (Using LSB and XOR)

For our encoder, we masked text into specific bits of an image so that the text is only visible through Stegsolve planes. 
To mask text into an image, he encoder pastes text onto an image and saves it as edited.png and then compares that image to the original to produce hidden.png. 
hidden.png is just a combination of both original.png and edited.png but with the different pixels between the two slightly altered into the original through bit operations.

Each pixel's color channel value ranges from 0 to 255, corresponding to 8 bits. By turning on and off these bits, we control which planes reveal the encoded information. For example, setting the rightmost bit (the least significant) to 1 would paint that pixel black on that plane in Stegsolve. If that bit were 0, it would be painted white. As the bits get more significant (from left to right), the color becomes less sharp and the image becomes more visually distorted.

Example: a pixel with bits: <br/>

```00000001``` would only appear on plane 0 <br/>
```00000100``` would only appear on plane 2 <br/>
```00101010``` would appear on planes 1,3,5 <br/>
```11111111``` would show up on all planes <br/>


## Hiding Images Within A Full Image

## Instructions

Our program is comprised of an image encoder and generator, which work in conjunction to encode a message within four different color modes and seven different planes. By checking our modified images with Stegsolve, we ensured that our program worked properly in realistic situations. This involved heavy research into the ways in which Stegsolve treats and attempts to break these forms of encryptions. 


## TryHackMe Room Implementation

Sources:
https://www.sciencedirect.com/science/article/abs/pii/S0165168409003648
Image Downgrading: https://www.petitcolas.net/steganography/image_downgrading/

Proposed Idea: Use image steganography on some of the image we include in the README


