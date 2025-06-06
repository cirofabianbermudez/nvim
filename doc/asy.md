# Asymptote notes

## Installation

```bash
sudo apt-get update
sudo apt-get install asymptote
asy --version
``


```plain
settings.outformat = "pdf";
defaultpen(fontsize(10pt));
label("Some label");
```


## Functions

```plain
void label(
  picture pic=currentpicture,
  Label L,
  pair position,
  align align=NoAlign,
  pen p=currentpen, 
  filltype filltype=NoFill
)
```


## References

[An Asymptote tutorial](https://asymptote.sourceforge.io/asymptote_tutorial.pdf)

