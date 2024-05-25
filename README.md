# `hledger-sankeymatic`

This is a script that calls `awk` to generate instructions you can then pluck into [SankeyMATIC](https://www.sankeymatic.com/) to get a nice-to-look-at flow diagram of your revenues and expenses tracked using `hledger`.

## Requirements

Make sure you have `awk` or `gawk` installed in your system.

## Usage

The script expects the output of `hledger is -NO csv`, thus to use this you have to:

1. Clone the repo

```sh
git clone https://github.com/victormihalache/hledger-sankeymatic.git
```

2. `cd` into the directory

```sh
cd hledger-sankeymatic
```

3. Not always, but you might have to give the script execute permissions.

```sh
chmod +x ./hledger-sankeymatic.sh
```

4. Pipe `hledger`'s output to the script

```sh
hledger incomestatement -N -O csv | ./hledger-sankeymatic.sh
```

On MacOS you can just copy this all:

```sh
git clone https://github.com/victormihalache/hledger-sankeymatic.git
cd hledger-sankeymatic
chmod +x ./hledger-sankeymatic.sh
hledger incomestatement -N -O csv | ./hledger-sankeymatic.sh
```
