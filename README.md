# FilterNCombine

This program filters simulation generated and reconstructed events to keep track of all possible omega candidates.

1. It iterates on events and counts how many particles (and of which kind) have been generated and reconstructed.
2. If there's an omega candidate for generated **or** for reconstructed, then it saves its direct values into the ntuple called **original** - that means, no combination have been done yet.
3. The combinatorial treatment is done for the generated particles, first. It looks at every particle of the event and tags (or keeps) their entry number. The process is repeated for every kind of particle.
The number of iterations match the number of possible combinations. Every possible combination is saved as a vector in a *vector of vectors*.
4. The same procedure is repeated for the reconstructed events.
5. At last, all the information is saved into the output ntuple called **mix**.

## Requirements

* ROOT v6.18 (I'm specifically using the version 6.18.04 located in `/apps/root/6.18.04/`)

## Compilation

Compile it by running **Makefile**.

## Usage

First, a previously formatted file with the following filename structure should exist within the directory.

```
pruned<target>_<identifier>.root
```

Then, for `FilterNCombine` to read that specific file, one should run:

```
./FilterNCombine -t<target> -r<identifier>
```

A new filled called `comb<target>_<identifier>.root` should be created.

* To remind the usage of the program, just run:

  ```
  ./FilterNCombine -h
  ```

### Example

To run it with the example input file, one should execute:

```
./FilterNCombine -tD -r01_01
```

If it worked properly, a new file called `combD_01_01.root` should appear within the directory.

## Hardcoded options and commentaries

* To try the program with a different amount of entries, one could edit the **Line 189** to any desired value. By default, it's set to look for all the entries.

* To print output messages of the process during the execution, one should un-comment by searching the "**commentary**" sections within the code.

* To measure time, one should un-comment the "**measure time**" sections. You can edit **Line 568** to change the unit in which the time will be shown, it's currently set to minutes.
  
* `FilterNCombine.h` is the library that contains all the functions to read and save the ntuple variables and their respective calculations. The combinatorial part is done by `FilterNCombine.cxx`.
