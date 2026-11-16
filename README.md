# Nyrax — Releases

***Nimble Yet Rigorous Application eXaminer*** — a deterministic DAST orchestrator
for web application security.

This repository hosts the **prebuilt Nyrax binaries and installers**. It is the
public distribution point: no source is built here. (The source lives in a
separate repository.)

Nyrax is a single-binary CLI (`nyx`) that scans web applications for
vulnerabilities. It runs its own built-in scanner as a zero-dependency floor, and
orchestrates best-in-class external tools (nuclei, sqlmap, dalfox, katana, …) when
they are installed — then merges everything into one reproducible report. Unlike
LLM-agent scanners, Nyrax is **deterministic**: the same scan gives the same
result, costs nothing per run, and is cheap enough to gate every CI build.

## Install (recommended)

```bash
# Linux / macOS
curl -fsSL https://github.com/benosons/nyrax-release/releases/latest/download/install.sh | bash

# Windows (PowerShell)
irm https://github.com/benosons/nyrax-release/releases/latest/download/install.ps1 | iex
```

The installer downloads a prebuilt standalone binary — no runtime required — and
installs it as `nyx` (with `nyrax` as an alias).

## Manual download

Grab the binary for your platform from the
[latest release](https://github.com/benosons/nyrax-release/releases/latest):

| Platform | Asset | Notes |
|----------|-------|-------|
| Linux x64 | `nyrax-linux` | |
| Windows x64 | `nyrax.exe` | |
| macOS (Apple Silicon) | `nyrax-macos` | arm64; Intel Macs are not yet published |

Then make it executable (`chmod +x`) and put it on your `PATH` as `nyx`.

## Quick start

```bash
nyx scan https://example.com                 # scan, writes an HTML report
nyx scan https://example.com --fail-on high  # exit 2 if any high+ finding (CI gate)
nyx doctor                                    # show which optional scanners are installed
nyx --help                                    # all commands and options
```

## What it detects

Built-in engine (no external tools needed): SQL injection (error / boolean /
time-based), context-aware XSS, SSTI, OS command injection, path traversal / LFI,
CRLF, open redirect, broken access control (IDOR/BOLA), CORS, TLS issues, exposed
files, security-header and cookie gaps. It crawls (redirects, GET/POST forms,
JS-bundle endpoints), does content discovery (ffuf) and hidden-parameter discovery
(arjun), and imports OpenAPI/Postman specs. Installed external tools add more depth —
nuclei, sqlmap, dalfox, nikto, testssl, katana, httpx, subfinder, ffuf, arjun, and
wpscan (run only when the target looks like WordPress).

## Authorization & legal

Nyrax sends real attack payloads. **Only scan systems you own or are explicitly
authorized to test.** Scanning without permission is illegal in most
jurisdictions. By default Nyrax refuses `localhost`, private IP ranges, and
internal hostnames.

## License & credits

Nyrax is licensed under **AGPL-3.0**. The tools it orchestrates and the libraries
it bundles remain under their own licenses — see [CREDITS.md](./CREDITS.md) for
full attribution.
