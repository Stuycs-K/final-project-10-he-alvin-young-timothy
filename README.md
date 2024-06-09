[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/ecp4su41)
# THIS DOCUMENT IS REQUIRED

## Group Info
Alvin He, Timothy Young
Period 10

## Overview

Our project is a complementary image steganography encoder for Stegsolve that hides messages in specific bits of each pixel. Through bit operations, each pixel can be turned on or off for each specific plane to produce nearly identical images that has a message only viewable through Stegsolve bitplane operations.

## Instructions

Our program is comprised of an image encoder and generator, which work in conjunction to encode a message within three different color modes and seven different planes. By checking our modified images with Stegsolve, we ensured that our program worked properly in realistic situations. This involved heavy research into the ways in which Stegsolve treats and attempts to break these forms of encryption. 


<details><summary><b>It's dangerous to go alone... Take <i>this!</i></b> 🦖</summary> 

<br/> 
Before running anything, make sure you have Stegsolve installed (get it <a href="https://wiki.bi0s.in/steganography/stegsolve/">here!</a>) in a location you can access
- to run Stegsolve, open the terminal and navigate to the directory where Stegsolve is installed in
- then run java -jar Stegsolve.jar and open the image in the pop-up interface

<br/> 
</details>

<br/> 

<b>Generator:</b> After running, a blank white image with text on top is produced

<br/> 

**Encoder:** After inserting the image and the text to hide in the image, run to get original.png (the original image), edited.png (the original image with text on top), and hidden.png (the original image with the text hidden in pixels)
<br/>

<details><summary>**Keybinds** ⌨️</summary> 
<br/> 

- pressing the key x changes the mode between ENCODE (hides text in the image) and XOR (inverts the image)
- pressing the key f changes the background between BLANK (white background with text) and FILL (actual image with text)
- pressing the key m changes the edited image from text to marks
- pressing the keys r, g, or b changes the plane color (between RED, GREEN, and BLUE respectively) being encoded and the hidden.png being produced
- pressing the keys 0 through 7 changes the plane number being 
- pressing ENTER changes the displayed image between original.png, edited.png, and hidden.png


After running the encoder, open up Stegsolve and open hidden.png and cycle through the planes until you find your hidden message!
<br/> 

</details>

To recap, here's a cute checklist we made:

- [ ] Install stegsolve 🦖
- [ ] Using `generator.pde`, generate your desired text upon a white background 🖋️
- [ ] With your generated image from `encoder.pde`, create three images: the original, the edited version, and the hidden version 🖼️
- [ ] Utilize key binds to cycle between encryption modes: 0-7 changes the encryption plane, and ENTER swaps between your images 🔃
- [ ] Place your hidden image into stegsolve to watch your message appear before your very eyes 👀
- [x] Have fun! :tada:

