---
title: Sound Reactive LED Stick | Projects | Sami Suteria
layout: default
---

# Sound Reactive LED Stick

Completed: March 2014

This project was for Dr. Dallas's Technology Start Up Class. So while the project was not as techincally demanding as other projects, I did learn a lot about PCB manufacturing and product design. 

## Demo Videos

<iframe src="//player.vimeo.com/video/99786144" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> <p><a href="http://vimeo.com/99786144">LED Test</a> from <a href="http://vimeo.com/user5265979">Sami Suteria</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

<iframe src="//player.vimeo.com/video/99786629" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> <p><a href="http://vimeo.com/99786629">PVC Test</a> from <a href="http://vimeo.com/user5265979">Sami Suteria</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

<iframe src="//player.vimeo.com/video/99786699" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> <p><a href="http://vimeo.com/99786699">Foam Test</a> from <a href="http://vimeo.com/user5265979">Sami Suteria</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

## Schematic

![Schematic](/static/LEDStick/LEDStick-Schematic.png)

## LEDs

The type of LEDs used for this project are branded as [NeoPixels](http://www.adafruit.com/category/168). They are really just [WS2812B LEDs](http://www.adafruit.com/datasheets/WS2812B.pdf) with Adafruit's branding. The nice thing about these LEDs is that they are RGB, individually addressable, and only require 3 pins from your microcontroller. 

## Microcontroller

I had started with an [Arduino Uno](http://arduino.cc/en/Main/arduinoBoardUno) because it was what I had on hand when I started the project. Later on I switched to Adafruit's [GEMMA](http://www.adafruit.com/products/1222) which was much smaller and cheaper. In the final PCB that I made for this project, I used just the bare [ATtiny85](https://www.sparkfun.com/products/9378) and programmed it using Sparkfun's [Pocket AVR Programmer](https://www.sparkfun.com/products/9825). 

The NeoPixel Library had to be modified to fit on to the ATtiny85 along with the code for analyzing the microphone and creating the different patterns. 

## Microphone

A few different microphones were used but I got the best results with a MEMS ADMP401 Microphone - breakout board can be gotten from [Sparkfun](https://www.sparkfun.com/products/9868).

## Case

Originally the design called for a hard plastic case with light diffusing plastic but since the product was going to be used in public, it was eventually decided that a softer foam would be a better choice. 

## Final Notes

I'm still working on the design for this product and I'll update this page as I do. I eventually want to make and sell this - but only when I can get the cost and look to something I'm happy with. 