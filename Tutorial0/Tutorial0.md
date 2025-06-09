# Tutorial 0 

## 0\. A little linux cheatsheet
=============================\
We will be using command line Terminals on Linux for this practical. In case you are unfamiliar with this venerable piece of software, here are a few useful commands and tricks:

-   Fundamentally, the terminal allows you to navigate your desktop's directories and operate on files therein. You are always 'in' a directory when using the terminal
-   `pwd`: **p**rint **w**orking **d**irectory - the path to the directory we are currently in.
-   `ls`: **l**i**s**t of directories and files in the current directory
-   `cd <path>`: **c**hange into the **d**irectory pointed to by `<path>`. We can indicate `<path>` in a number of ways:
-   Relative to the current directory
-   Absolute path (as returned by `pwd`)
-   `cd -` goes to the previous directory
-   `cd` goes to the home directory. You can also use `~` to indicate the home directory.
-   For all the commands below, you can specify a path - that is, the items you operate on don't have to be in the current working directory.
-   In paths, a `/` separates different directory names.
-   `mkdir <directory>`: **m**a**k**e a new **dir**ectory.
-   `cp <items> <target>`: **c**o**p**y `<items`> to `<target>`. There are a few subtleties here:
-   If any of your `<items>` is a directory, you must use `cp -r`.
-   If `<target>` is a directory, all `<items>` will be moved into the directory.
-   If `<target>` is a name (either of an existing file, or a name which does not exist), there can only be a single `<item>`, which will be renamed to `<target>`.
-   `mv <items> <target>`: similar to `cp`, but it **m**o**v**es the `<items>`; `-r` is not necessary even for directories.
-   `rm <path>`: **r**e**m**ove (delete) whatever is indicated by `<path>`. If it is a directory, you must use `rm -r`.
-   The current directory is accessed by `.`, and its parent directory is accessed by `..` .
-   You can use the tab key on your keyboard to autocomplete commands and filenames. When there are several options, press tab twice in quick succession to list them all.
-   `vim` is a text editor designed for the command line. It is many-featured, but basic use is quite simple. You can open a file with `vim <filename>`. Upon opening the file, you cannot directly begin editing it. To do so, you must enter the insert mode, which is achieved by pressing `i`. You will have to navigate using your cursors. When you are done editing, press `esc` to exit the insert mode. Then, to save your changes and close the document, type `:wq`and press enter.

This is only the smallest of selections of what the terminal can do. Don't be afraid to experiment - if there is something you find yourself wishing the terminal could do, chances are it already can! The terminal is extremely powerful, given that your entire operating system is in essence files and operations on them (which are also stored in files somewhere). So be careful and if you are unsure, check with your demonstrators!

## 1\. CASTEP 
===========

A CASTEP calculation is set up using two files `<seed>.cell` and `<seed>.param` (where <seed> is the name of the compound, for example <seed> can be Si for silicon). Note that they are rather free-form and case-insensitive. `<seed>.param` sets the type of calculation, the way it is carried out, its precision, and so on. `<seed>.cell` contains keywords and blocks relevant to geometry, both in real and reciprocal space.\
CASTEP has a very useful functionality to aid you in looking for keywords: Typing `castep.serial -h <keyword>`will print information about the keyword to the terminal. Another useful CASTEP flag is -s (for 'search'). `castep.serial -s <item>` will print all keywords related to this item. For instance, if you wanted to learn about the different options for running molecular dynamics with CASTEP, `castep.serial -s md` would be a great starting point.

Obtaining the crystal structure
-------------------------------\
There are few of getting the positions of the atoms to put in the input files.

-   It is possible (if you're fortunate enough to have them), that your experimental collaborators will tell you the crystal structure.
-   You may have to predict possible candidates yourself (to aime of the AIRSS tutorials !)
-   There are a number of online databases collecting known crystal structures.
-   [The Materials Project](https://www.google.com/url?q=https://next-gen.materialsproject.org/&sa=D&source=editors&ust=1747677492442819&usg=AOvVaw07cNIND5ieweyWTPyLFdnk) is a highly comprehensive database of both experimentally found and theoretically predicted structures.
-   [The Inorganic Crystal Structure Database (ICSD)](https://www.google.com/url?q=https://www.psds.ac.uk/icsd&sa=D&source=editors&ust=1747677492443083&usg=AOvVaw2-gwhDU8byDw7-_AHl63X0) collects experimental crystal structures and the articles in which they were presented.

I would recommend using the Materials Project to search for the Si crystal structure as an example. Silicon (Si) is a well-known semiconductor. We are interested in the structure with the lowest formation enthalpy. You can download the structure into a Crystallographic Information File (cif). However, this is different from the `.cell` format CASTEP needs. Several tools exist to enable conversion between different structure formats:

-   `c2x` is a many-featured toolkit to support electronic structure calculations. Converting to .cell is as simple as `c2x --cell Si.cif > Si_structure.cell`.
-   `cabal` comes with AIRSS (which we will use on Friday) and is a minimalist structure conversion tool.

`cabal` does not support `.cif` as input, so use `c2x` to convert the structure. Notice that `Si_structure.cell` has 8 Si atoms, but the primitive cell of Si has only 2. The more atoms we model explicitly, the more expensive our calculations will be. Can you modify the `c2x` command to convert the structure to its primitive cell? Use `c2x -h` to print a list of flags and their effects. Once you have the primitive cell of Si in `.cell` format, copy the `lattice_cart` and `positions_frac` blocks into the `Si.cell` file you already have.\
Finally, to test everything works, run your first full CASTEP calculation: `mpirun -np 8 castep.mpi Si`. Note that the `.cell` and `.param` file must have the same fileroot (`Si` in this command's case). This should only take a few seconds. The output is stored in `Si.castep`. Open this file and take a look through. A few things you might wish to look for, as they will often come in useful:

For more information you can see the CASTEP webage [https://www.castep.org](https://www.castep.org/). The complete tutorial on CASTEP made by Dr. Pascal Saltzbrenner is available on his github page: <https://github.com/PascalSalzbrenner/ljc_castep_airss_eddp_practicals?tab=readme-ov-file>.