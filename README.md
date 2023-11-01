
```
┬ ┬┬ ┬┬ ┬ ┌─┐┬ 
│ │││││ │ ├┤ │ 
└─┘└┴┘└─┘o└─┘┴─┘
```

Version 3.

By: ~vidak

[vidak@riseup.net](mailto:vidak@riseup.net)

[@vidak:matrix.kaczynski.life](#social:matrix.kaczynski.life)

[@vidak@zoinks.one](https://zoinks.one/users/vidak)


# DESCRIPTION

This is a virtual pet for GNU Emacs. You can feed, clean, and play
with your pet. There are, in all, 10 different 'evolutions' of pet.

Looking after your pet well will make it live longer, and allow you to
evolve into a final 'secret' pet species.

This time around, the care that you put into looking after your pet
determines whether it becomes 'chaotic' or 'lawful'.

# LICENCE

``` 
This program is free software: you can redistribute it and/or
modify it under the terms of the GNU General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
General Public License for more details.
```

[A quick guide to the GNU GPL v3.](https://www.gnu.org/licenses/quick-guide-gplv3.html)

# README

## Version 3 Will Feature Several Discrete Variations

> 2023-November-1.
> ~ 0225 HRS

### 0 - Introductions

the [tamagotchi fandom
wiki](https://tamagotchi.fandom.com/wiki/Tamagotchi_(1996_Pet)) has
improved markedly over the last few months, and now includes more
information about how the original tamagotchi game functions.

Because of their excellent documentation, I was able to more
accurately simulate a virtual pet in Emacs Lisp.

two things:

### 1 - release several simplified variations for Version 3

i may release version 3 as several different variations, to allow
people to experience the life-cycles of different pet species
discretely. the original tamagotchi had six different shell colours,
indicating six different species. this would not mean that there would
be growth/evolution, however. i may experiment with
networking/internet connectivity if this is the case, because it would
simplify the game significantly.

from the wiki:

- one baby variation
- one child variation
- two teen variations
- six adult variations
- one ‘special character’ that evolves from one particular adult variation.

how would networking function? i am not sure. i need to do some
exploration on that topic. if anyone has any suggestions, i am open to
listening (:

### 2 - adopt original tamagotchi timing for Version 3

i will probably adopt the ‘timing schedule’ of pet growth of the
original tamagotchi. from the [tamagotchi wiki](https://tamagotchi.fandom.com/wiki/Tamagotchi_(1996_Pet)#Growth,_Care,_and_Lifespan):

> Five minutes after the clock is set, the Tamagotchi will be born,
> and will go through several stages of life. It begins with the Baby
> stage and evolves to the Child stage after 65 minutes. It will
> evolve into a teen at the age of 3, and into an adult by the age of
> 6.

this means:

- egg hatches after 5 mins
- baby turns into child after 65 mins
- child becomes teen after 3 days
- teen becomes adult after 6 days

so each stage lasts:

- egg (5 mins)
- baby (65 mins)
- child (3 days)
- teen (6 days)
- adult (dependent on user care for pet)

## How to get

```
git clone https://git.sr.ht/~vidak/uwu.el
```

## How to run

```
M-x ielm
```

then:

```
ELISP> (load "path-to/uwu.el/version-3/gfx/chaotic/pack-0.el")
ELISP> (load "path-to/uwu.el/version-3/mvc/controller.el")
ELISP> (load "path-to/uwu.el/version-3/mvc/model.el")
ELISP> (load "path-to/uwu.el/version-3/mvc/view.el")
```

then:

```
ELISP> (uwu-init) ;; this will wipe your game.
ELISP> (uwu-main-loop)
```

[video 00](uwu-v3-demo-video-00.mp4)

[video 01](uwu-v3-demo-video-01.mp4)
