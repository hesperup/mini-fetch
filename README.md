# mini-fetch

A tiny, dependency-light system fetch tool in the spirit of
[neofetch](https://github.com/dylanaraps/neofetch) and
[fastfetch](https://github.com/fastfetch-cli/fastfetch).

It is written in **pure POSIX `sh`** and uses only stock system utilities, so it
runs on systems where Bash, Perl, Python or a recent `awk` are unavailable —
including **legacy iOS / iPhone OS devices** (jailbroken iPhone / iPad / iPod
touch). It has no runtime dependencies and no configuration files.

> **Note:** All of the code in this project was written by AI. It is only meant
> for tinkering with the devices at home, and will **not** be maintained or
> updated.
>
> **说明：** 本项目代码全部由 AI 编写，仅用于折腾家中的设备，**不维护、不更新**。

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
  'XMMMMMMMMMMMMMMMMMMMMMMMMK.  Disk      ████████████░░ 8.8GiB / 14.7GiB (59%)
    kMMMMMMMMMMMMMMMMMMMMMMd    Local IP  192.168.31.70
     ;KMMMMMMMWXXWMMMMMMMk.
       "cooc*"    "*coo'
```

## Features

- Device-aware output: on iOS it maps the machine identifier (`iPad3,4`, …) to a
  friendly model name, SoC (CPU) and GPU.
- Memory, battery (with charge level + cycle count) and local IP.
- Disk usage reported per **whole physical device** (Linux via `lsblk`,
  iOS/other via `df`), so unallocated space and LVM volumes are included. An
  iOS device therefore reports its full capacity, and machines with several
  disks get one line each.
- Colored, aligned fields and unicode progress bars.
- Side logo chosen by OS (Apple on iOS/macOS, Tux on Linux, generic otherwise).
- Prefers a wired/wireless NIC for the local IP on Linux (skips usb-gadget,
  docker, tailscale, …).
- Battery is detected from any `/sys/class/power_supply/*` node of type
  `Battery` on Linux (not just `BAT*`).
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

## Tested platforms

Tested on:

- a jailbroken **iPad 4 (iPad3,4 / A6X / iOS 10.3.3, Darwin 16.7.0)** with
  `bash`, `gawk` and `bc` installed via Cydia. mini-fetch itself only needs the
  stock utilities (`sw_vers`, `sysctl`, `uname`, `ioreg`, `df`, `dpkg`,
  `ipconfig`, `vm_stat`, `tput`, `mktemp`, `sed`, `grep`).
- **postmarketOS** on a Xiaomi Redmi 5A (BusyBox `df`, `apk`, `lscpu`).
- Ubuntu Linux (GNU coreutils).

## License

MIT — see [LICENSE](LICENSE).
