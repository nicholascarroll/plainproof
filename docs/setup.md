# Setting up the tools

Versions are pinned in `../versions.env`. These are the steps used to build them.

## SBCL and SWI-Prolog

From your package manager. SBCL 2.2.9 and SWI-Prolog 9.0.4 were used.

## ACL2

```
git clone https://github.com/acl2/acl2.git ~/tools/acl2
cd ~/tools/acl2
git checkout 7ac80c830dd91e094c73f869acb06d877e717b36
make LISP=sbcl
books/build/cert.pl --acl2 ~/tools/acl2/saved_acl2 std/lists/top arithmetic/top-with-meta
```

The last line certifies the library books the project includes. The first run is slow.

## The Attempto parser (APE)

```
git clone https://github.com/Attempto/APE.git ~/ape
cd ~/ape
git checkout 5f4d5354a45fb772763bf1a9543f508f15b28982
make install
```

This builds `~/ape/ape.exe`.

## Running

```
TOOLS_DIR=~/tools APE=~/ape/ape.exe sh check.sh
```

`TOOLS_DIR` is the directory containing `acl2/`, and `APE` is the path to `ape.exe`.
