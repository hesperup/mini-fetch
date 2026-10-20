# mini-fetch

A tiny, dependency-light system fetch tool in the spirit of
[neofetch](https://github.com/dylanaraps/neofetch) and
[fastfetch](https://github.com/fastfetch-cli/fastfetch).

It is written in **pure POSIX `sh`** and uses only stock system utilities, so it
runs on systems where Bash, Perl, Python or a recent `awk` are unavailable —
including **legacy iOS / iPhone OS devices** (jailbroken iPhone / iPad / iPod
touch). It has no runtime dependencies and no configuration files.

```
                    c.'         mobile@roots-iPad
                 ,xNMM.         ─────────────────
               .OMMMMo          OS        iPhone OS 10.3.3 (14G60) iPad3,4
               lMMM"            Host      iPad 4
     .;loddo:.  .olloddol;.     Kernel    16.7.0
   cKMMMMMMMMMMNWMMMMMMMMMM0:   Uptime    21h 42m
 .KMMMMMMMMMMMMMMMMMMMMMMMWd.   Packages  147 (dpkg)
 XMMMMMMMMMMMMMMMMMMMMMMMX.     Shell     sh
;MMMMMMMMMMMMMMMMMMMMMMMM:      Terminal  /dev/ttys000
:MMMMMMMMMMMMMMMMMMMMMMMM:      CPU       Apple A6X (2) @ 1.4GHz
.MMMMMMMMMMMMMMMMMMMMMMMMX.     GPU       PowerVR SGX554MP4
 kMMMMMMMMMMMMMMMMMMMMMMMMWd.   Memory    ███░░░░░░░░░░░ 221MiB / 987MiB
 'XMMMMMMMMMMMMMMMMMMMMMMMMMMk  Battery   ███████░░░░░░░ 57% (140 cycles)
  'XMMMMMMMMMMMMMMMMMMMMMMMMK.  Disk      ████████████░░ 2.1GiB / 2.4GiB (87%)
    kMMMMMMMMMMMMMMMMMMMMMMd    Local IP  192.168.31.70
     ;KMMMMMMMWXXWMMMMMMMk.
       "cooc*"    "*coo'
```

## Features

- Device-aware output: on iOS it maps the machine identifier (`iPad3,4`, …) to a
  friendly model name, SoC (CPU) and GPU.
- Memory, battery (with charge level + cycle count), disk and local IP.
- Colored, aligned fields and unicode progress bars.
- Optional Apple-style side logo (auto-enabled on wide interactive terminals).
- Works on iOS, macOS, Linux and other Unix-likes with graceful fallbacks.
- Fast: ~1s on an iPad 4 (Apple A6X).

## Install

```sh
git clone https://github.com/hesperup/mini-fetch.git
cd mini-fetch
./install.sh                 # installs to ~/.local/bin (override with PREFIX=...)
```

Or copy it manually:

```sh
install -m 755 fetch ~/.local/bin/fetch   # or /usr/local/bin
```

Make sure `~/.local/bin` is on your `PATH`, then run:

```sh
fetch
```

## Usage

```
fetch [options]

  --no-color     Disable ANSI colors
  --no-bar       Disable progress bars
  --logo         Show the side logo
  --no-logo      Hide the side logo
  -h, --help     Show help
  -v, --version  Show version
```

The logo is shown automatically when stdout is an interactive terminal at least
74 columns wide; otherwise the plain text layout is used.

## iOS notes

Tested on a jailbroken **iPad 4 (iPad3,4 / A6X / iOS 10.3.3, Darwin 16.7.0)**
with `bash`, `gawk` and `bc` installed via Cydia. mini-fetch itself only needs
the stock utilities (`sw_vers`, `sysctl`, `uname`, `ioreg`, `df`, `dpkg`,
`ipconfig`, `vm_stat`, `tput`, `mktemp`, `sed`, `grep`).

## License

MIT — see [LICENSE](LICENSE).
