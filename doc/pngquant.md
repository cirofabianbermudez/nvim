# pngquant notes

## Installation

```bash
sudo apt-get install pngquant
```

## Flags

| Flag                | Description                                            |
| ------------------- | ------------------------------------------------------ |
| `--ext <new.png>`   | Set custom suffix/extension for output filenames       |
| `--output <file>`   | Destination file path to use of `--ext`                |
| `--quality=min-max` | Don't save below min, use fewer color below max (1-100)|
| `--speed N`         | Speed/quality trade-off. 1=slow, 4=default, 11=fast    |
| `--strip`           | Remove optional metadata                               |


## Usage

```bash
pngquant [options] [number of colors] [input file]
```

## Examples

```bash
pngquant 256 --speed 1 --quality=50-65 --strip --ext -comp.png 01_vida.png
```

# optipng

## Installation

```bash
sudo apt-get install optipng
```

## Usage

```bash
optipng -o7 -strip all -out test.png 01_vida.png
```


```bash
pngquant 256 --speed 1 --quality=50-65 --strip --ext -comp.png --force 01_vida.png
optipng -o7 -strip all -out test.png 01_vida.png
```

images should have a size of arround 100-300 KB
and a size of 800-1200 pixels wide
