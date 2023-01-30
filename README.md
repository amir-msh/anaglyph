![anaglyph package header](https://user-images.githubusercontent.com/61120718/212234454-8b3105ba-66bc-4bc3-a539-1907417a1cf4.png)
[The nebula image's credit: NASA, ESA, CSA, and STScI](https://www.nasa.gov/image-feature/goddard/2022/nasa-s-webb-reveals-cosmic-cliffs-glittering-landscape-of-star-birth)      

# Anaglyph Package

Create awesome 3D Flutter applications using the Anaglyph package!      

It supports all platforms and works on any kind of color display.      

You can use this package to convert normal 2D widgets to 3D widgets, the 3D effect can be felt using anaglyph glasses. It's a well-priced glass, but you don't even have to buy an anaglyph glass, you can simply create one!      

-------

## What is Anaglyph?

> Anaglyph 3D is the stereoscopic 3D effect achieved by means of encoding each eye's image using filters of different (usually chromatically opposite) colors, typically red and cyan. Anaglyph 3D images contain two differently filtered colored images, one for each eye. When viewed through the "color-coded" "anaglyph glasses", each of the two images reaches the eye it's intended for, revealing an integrated stereoscopic image. The visual cortex of the brain fuses this into the perception of a three-dimensional scene or composition.
> 
> [**\- Wikipedia**](https://en.wikipedia.org/wiki/Anaglyph_3D)

In other words, the Anaglyph method is an easy and low-cost way to create 3D images. It doesn't require a special type of display! You can use any colored displays to view the anaglyph images. It's the perfect choice for those looking for a simple, low-cost solution to produce 3D images.   

## Features

- Convert any widget to a 3D anaglyph version

- Ability to change the 3D depth

- Changes can be applied with a custom animation

## Caution

This package is currently in the alpha channel and it's not ready for production use.     
**Don't use it in serious projects until the stable version comes out.**      
I'm hardly trying to make it stable as soon as possible.      

## Quick Start Guide

- Use `AnaglyphView` to create a 3D appearance.      
   
- Use `AnaglyphStyle` to set anaglyph style for subtrees.     
    
- Use `AnimatedAnaglyphStyle` to apply anaglyph style changes with a custom animation.      

## Basic Usage

You can use any other widget instead of `Image.network`, but those widgets which don't contain any color but black, can't become 3D!

```dart
AnaglyphView(
    depth: -7,
    child: Image.network(
        'https://www.nasa.gov/sites/default/files/thumbnails/image/pillars_of_creation.jpg',
    ),
),
```

<img src="https://raw.githubusercontent.com/amir-msh/anaglyph/main/screenshots/nebula-readme-example-min.png" alt="Flutter logo output" height="390" width="auto">

#

If you want to wrap the widgets which have a transparent background (e.g., Text, Icon, FlutterLogo) in `AnaglyphView`, make sure `clipOuters` is false :

```dart
AnaglyphView(
    depth: -4,
    clipOuters: false,
    child: FlutterLogo(size: 250),
),
```

<img src="https://raw.githubusercontent.com/amir-msh/anaglyph/main/screenshots/flutter-logo-readme-example-min.png" alt="Flutter logo output" height="390" width="auto">
     

## Donation

If you like this package, I'll be happy to receive your generous donations!😃     

<a href="https://www.buymeacoffee.com/amirmsh" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" style="box-shadow: 0px 1px 9px brown; border-radius:10px;" height="auto" width="210"></a>