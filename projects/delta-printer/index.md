---
title: Delta 3D Printer | sami suteria 
layout: default
---

# Delta 3D Printer

This 3D printer is based on the [design](http://www.openbuilds.com/builds/delta-six.476/) from Sage on OpenBuilds. Some design changes were made based on access to tools. This design is based on using OpenBuilds 20x40mm V-Slot aluminum extrusions. 

## Build of Materials

### Hardware

| Qty | Price | Part Name | Vendor |
|:--- |:----- |:--------- |:------ |
| 3x  | $0.80 | Nylon Lock Nuts - M3 5 Pack | Home Depot |
| 2x  | $0.75 | Hex Nuts - M3 5 Pack | Home Depot |
{: class="table table-bordered"}


## Setup 

Connect everything to the RAMPS 1.4 board [Wiring Diagram](http://reprap.org/mediawiki/images/6/6d/Rampswire14.svg). Then load [Marlin](https://github.com/MarlinFirmware/Marlin) (currently 1.0.2) on to your board. Replaced stock Configuration.h with the example in the Delta folder. Since I'm using the [RepRapDiscount Full Graphic Smart Controller](http://reprap.org/wiki/RepRapDiscount_Full_Graphic_Smart_Controller) I need to install the [U8glib library](https://bintray.com/olikraus/u8glib/Arduino) to my ardiuno libaries folder. 

Current settings for Marlin and a copy of U8glib have been uploaded to [github](https://github.com/samisuteria/DeltaPrinter)
















<!--
## Things to research

- Traxxas ball joints
- http://www.tridprinting.com/Mechanical-Parts/#3D-Printer-Rod-Kit
- http://www.tridprinting.com/BOM/Kossel-Mini/
- Carriage design
- Arm length (80% of distance between vertical posts?)
- Effector w/ 1.75mm E3DV6
- Magnetic Effector: https://www.youmagine.com/designs/kossel-plus-magnetic-effector#!design-information
- Magnetic Ball Joint Rod Ends: https://www.youmagine.com/designs/magnetic-ball-joint-rod-ends
- http://www.ultibots.com/nema-17-damper-astrosyn-my17rmdamp/
- Delta robot calculator: http://www.thinkyhead.com/_delta/
- Ditto: https://sites.google.com/site/3dprinterlist/delta-3d-printers/delta-robot-calculator


## BOM

### To Find

- Limit Switches
- Heated bed
- Power supply (ATX PC Supply?)
- Extruder

### 3D Printed

| Qty | Part Name | Links| Status |
|-----|-----------|------|--------|
| 6x  | Vertex              | [STL](Resources/Delta-Six/vertex_20x40.stl) - [PNG](Resources/Delta-Six/vertex_20x40.png) | Printing
| 3x  | Vertex Idler Cap    | [STL](Resources/Delta-Six/vertex_20x40_idler_cap.stl) - [PNG](Resources/Delta-Six/vertex_20x40_idler_cap.png) | Printing
| 3x  | Carriage Backplate  | [STL](Resources/Delta-Six/carriage_20x40_backplate.stl) | Not Started
| 3x  | Carriage            | [STL](Resources/Open-Builds/d6magcar.stl) | Not Started
| 1x  | Effector            | [STL](Resources/kossel-plus-magnetic-effector/magneticEffector.stl) | Not Started
{: class="table table-bordered"}

### Frame

| Qty | Price | Part Name | Link | Status  |
|-----|-------|-----------|------|---------|
| 6x  | $7.15 | Black V-Slot 20x40 500mm              | [OpenBuilds](http://openbuildspartstore.com/black-v-slot-linear-rail/) | Ordered
| 3x  | $14.30| Black V-Slot 20x40 1000mm             | [OpenBuilds](http://openbuildspartstore.com/black-v-slot-linear-rail/) | Ordered
| 3x  | $4.50 | Low Profile Screws M5 10mm - 25 Pack  | [OpenBuilds](http://openbuildspartstore.com/low-profile-screws-m5/) | Ordered
| 3x  | $4.95 | Tee Nuts M5 - 25 Pack                 | [OpenBuilds](http://openbuildspartstore.com/tee-nuts-25-pack/) | Ordered
| 2x  | $2.75 | Low Profile Screws M5 40mm - 10 Pack  | [OpenBuilds](http://openbuildspartstore.com/low-profile-screws-m5/) | Ordered
| 1x  | $60   | 288mm Assembled Arms w/ Magnets + Ball Sockets | [Haydn Huntly](https://groups.google.com/forum/m/#!topic/deltabot/485cfVFrFFU%5B1-25%5D) | Ordered
{: class="table table-bordered"}

**Total: $179.65 + Shipping**

### Movement

| Qty | Price | Part Name | Link | Status |
|-----|-------|-----------|------|--------|
| 3x  | $17.50| NEMA 17 Stepper Motor | [OpenBuilds](http://openbuildspartstore.com/nema-17-stepper-motor/) | Ordered
| 3x  | $6.95 | GT2 30 Teeth Pulleys | [OpenBuilds](http://openbuildspartstore.com/gt2-2mm-aluminum-timing-pulley-30-tooth/?page_context=category&faceted_search=0) | Had
| 12x | $3.95 | Solid V Wheel Kit | [OpenBuilds](http://openbuildspartstore.com/solid-v-wheel-kit/?page_context=category&faceted_search=0) | Had
| 3x  | $4.85 | Smooth Idler Pulley Wheel Kit | [OpenBuilds](http://openbuildspartstore.com/smooth-idler-pulley-wheel-kit/) | Ordered
| 1x  | $18.99| GT2 Belt 5M | [Amazon](http://www.amazon.com/Meters-pitch-wide-Timing-printer/dp/B00F2IQNX8/ref=sr_1_1?ie=UTF8&qid=1434351828&sr=8-1&keywords=gt2+belt&refinements=p_85%3A2470955011#customerReviews) | Ordered
{: class="table table-bordered"}

**Total: $154.29** | **New Parts: $86.04**

### Electronics

| Qty | Price | Part Name | Link | Status |
|-----|-------|-----------|------|--------|
| 1x  | $64.95| RAMPS 1.4 + Arduino Mega + 5x Stepper Motor Drivers (A4988) + LCD SD Card Reader | [Amazon](http://www.amazon.com/Sintron-Controller-Mega-2560-R3/dp/B00L9BX8AS/ref=cm_cr_pr_sims_t/180-4270232-2404508) | Ordered
{: class="table table-bordered"}

**Total: $64.95**

### Shipping

| Supplier | Shipping Amount | Comments |
|----------|-----------------|----------|
| Open Builds| $0            | Initial frame order - free shipping weekend
| Haydn Huntly | $4x         | $4 flat shipping anywhere in the US
{: class="table table-bordered"}
-->



