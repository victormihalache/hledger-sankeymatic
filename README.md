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
hledger incomestatement -N -O csv --no-conf | ./hledger-sankeymatic.sh
```

On MacOS/Linux you can just copy this all:

```sh
git clone https://github.com/victormihalache/hledger-sankeymatic.git
cd hledger-sankeymatic
chmod +x ./hledger-sankeymatic.sh
hledger incomestatement -N -O csv --no-conf | ./hledger-sankeymatic.sh
```

## Roadmap

These are the things I want to work on when I either have time to tackle them or when I find out how to do them. If you with to help out feel free to open an issue or a PR.

- [ ] Differentiate when two accounts have the same sub-account
- [ ] Allow customizing the name of the intermediary "Budget" sub-account
