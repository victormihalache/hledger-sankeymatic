# `hledger-sankeymatic`

This is a script that calls `awk` to generate instructions you can then pluck into [SankeyMATIC](https://www.sankeymatic.com/) to get a nice-to-look-at flow diagram of your revenues and expenses tracked using `hledger`.

## Requirements

Make sure you have `awk` or `gawk` installed in your system.

## Install

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

...or you can just copy this all:

```sh
git clone https://github.com/victormihalache/hledger-sankeymatic.git
cd hledger-sankeymatic
chmod +x ./hledger-sankeymatic.sh
```

## Usage

To run the script, pipe the output of `hledger` to the script:

```sh
hledger incomestatement -N -O csv --no-conf | ./hledger-sankeymatic.sh
```

If on MacOS, you can copy the output to the clipboard by adding another pipe to `pbcopy` as such:

```sh
hledger incomestatement -N -O csv --no-conf | ./hledger-sankeymatic.sh | pbcopy
```

## Roadmap

These are the things I want to work on when I either have time to tackle them or when I find out how to do them. If you with to help out feel free to open an issue or a PR.

- [ ] Differentiate when two accounts have the same sub-account
- [ ] Allow customizing the name of the intermediary "Budget" sub-account
