
```
┬ ┬┬ ┬┬ ┬ ┌─┐┬ 
│ │││││ │ ├┤ │ 
└─┘└┴┘└─┘o└─┘┴─┘
```

Version 2.

_Version 3 is currently under development, as of 2022-09-12._

By: ~vidak

=> mailto:vidak@riseup.net vidak@riseup.net

# DESCRIPTION

This is a virtual pet for GNU Emacs. You can feed, clean, and play
with your pet. There are, in all, 39 different 'evolutions' of pet.

Looking after your pet well will make it live longer, and allow you to
evolve into a final 'secret' pet species.

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

=> https://www.gnu.org/licenses/quick-guide-gplv3.html A quick guide to the GNU GPL v3.

# README

Steps to get *uwu.el* running:

0. Download the two Version 2 files:

```
- uwu.el; and 
- uwu-graphics-v2.el
```

1. Save `uwu.el` and `uwu-graphics-v2.el` to your `~/.emacs.d/` load
  path.

2. Restart Emacs, so that the two files are automatically loaded.

3. If, for some reason, the two files fail to load, run:

```
M-x load-file ~/.emacs.d/path-to/uwu.el
```

and

```
M-x load-file ~/.emacs.d/path-to/uwu-graphics-v2.el
```

4. Open a blank buffer, like *scratch* (for instance) and type:

```
M-x uwu-mode
```

5. Observe the following image:

![](https://img.itch.zone/aW1nLzg2NDU3MzEucG5n/original/tnMX9I.png)

Line 247 in the image **contains your pet's hearts**. You replenish
your pet's hearts by executing:

```
M-x uwu-feed
```

Lines 242 and 243 **contain your pet's poops**. Clean your pet's poops
away by executing:

```
M-x uwu-clean-up
```

6. When you start the game, your 'high score' will, at first, equal
-10 (negative ten). Do not worry! This is normal! Your pet will not
hatch from its egg until your 'high score' reaches 0 (zero).

7. ???

8. UwU
