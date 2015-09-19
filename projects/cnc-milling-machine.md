---
title: CNC Milling Machine | Projects | Sami Suteria
layout: default
---

# CNC Milling Machine

## Project Description

Create a CNC Milling/Routing machine that can accept G-Code from a variety of CAD/CAM software. It should be able to mill and route different types of materials including wood, aluminum, and copper clad boards. Resolution of the device is aimed to be 100 micron (~4 mils).

The milling machine is using a [Shapeoko 2 Mechanical Kit](https://www.inventables.com/technologies/desktop-3d-carving-cnc-mill-kit-shapeoko-2) as the frame. The electronics and other parts are being sourced from other vendors. A custom board and software/interface will be designed by me. 

## Build of Materials

Currently Ordered Parts (As of 9/12/2014)

| Part 						| Quantity | Cost 	| Vendor |
|:--------------------------|:---------|:-------|:-------|
|Shapeoko 2 - Mechanical Kit| 1    	   | $300 	| [Inventables](https://www.inventables.com/technologies/desktop-3d-carving-cnc-mill-kit-shapeoko-2)|
|Stepper Motor - 68 oz/in   | 4        | $16.95 | [Sparkfun](https://www.sparkfun.com/products/10846)|
|Tiva Connected Launchpad   | 1        | $20.03 | [Mouser](http://www.mouser.com/ProductDetail/Texas-Instruments/EK-TM4C1294XL/?qs=sGAEpiMZZMvHnN%252b%2fGH9WnaMj0ZnpE29GCb6fbwV2Hww%3d)|
|DRV8825 Stepper Motor Driver | 4      | $8.95  | [Pololu](http://www.pololu.com/product/2133)|
|12V 5A Power Adapter       | 1        | $18.95 | [Pololu](http://www.pololu.com/product/1468)|
|GT2 Aluminum Timing Pulley | 3        | $5     | [OpenBuilds](http://openbuildspartstore.com/gt2-2mm-aluminum-timing-pulley-20/)|
|GT2 Timing Belt            | 5        | $2.50  | [OpenBuilds](http://openbuildspartstore.com/gt2-2mm-timing-belt/)|
|Micro Limit Switch Kit		| 6 	   | $4.50  | [OpenBuilds](http://openbuildspartstore.com/micro-limit-switch-kit-with-mounting-plate/)|
{: class="table table-bordered"}

## Build Notes

This machine is basically three linear drive trains. The X and Y axis both use timing belts while the Z axis uses a threaded rod. 

The timing belt used in the machine is a GT2 timing belt along with a corressponding pulley. The timing belt has a pitch of 2mm which means there is 2mm betwen each tooth of the belt. These teeth lock into the teeth of the pulley. The pullies uses in the machine have 20 teeth. This means that one full revolution of the pulley will move whichever axis a total of 40mm. 

Since the stepper motors in this machine have a resolution of 400 steps per revolution this means thats the machine moves 0.1mm per step. Now to increase this resolution, the machine uses TI DRV8825 stepper motor drivers which can do microstepping of 1/32 of a step. This means that every step on the stepper motor can be divided into 32 microsteps. This affectly increases the resolution by a factor of 32. So now the machine moves 40mm in 12800 steps or 0.003125mm/step. 

There are other pullies available in the GT2 size. Sizes range from 16 teeth to 36 teeth. The fewer teeth on a pulley, the higher the resolution of the device. Resolution can be given up to gain speed. For this project a middle value was selected and after testing the size of the pulley may change.

Some testing parameters used currently: 

* 1/8 microstep
* 40mm / (400 steps * 8 microsteps) = 0.0125mm/step = .4921 mils/step

When milling - a trace width of 50 mils is recommended and the ground plane should be isolated from the traces by 25mil. This advice comes the great and powerful Wayne Cox. When designing the example board for testing the milling machine, a variety of trace sizes were used. Traces ranged from 66 mil to 10 mil. 

## GCode Prep

After PCBGCode is installed with EagleCAD the following settings need to be set (these are still a work in progress). 



## GCodes




