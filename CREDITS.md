# Credits & Acknowledgements

Nyrax stands on the shoulders of the open-source security community. Nyrax is an
*orchestrator*: much of its depth comes from established tools that it runs and
whose output it parses. We are grateful to their authors and maintainers.

## Orchestrated scanners (run as separate programs)

Nyrax invokes these as external command-line programs **when they are installed**.
They are **not** bundled with Nyrax or its published binaries — users install them
separately (e.g. `nyx doctor --install`, or a package manager). Each tool remains
the work of its own authors, under its own license:

| Tool | Author / Project | License |
|------|------------------|---------|
| [nuclei](https://github.com/projectdiscovery/nuclei) | ProjectDiscovery | MIT |
| [katana](https://github.com/projectdiscovery/katana) | ProjectDiscovery | MIT |
| [httpx](https://github.com/projectdiscovery/httpx) | ProjectDiscovery | MIT |
| [subfinder](https://github.com/projectdiscovery/subfinder) | ProjectDiscovery | MIT |
| [dalfox](https://github.com/hahwul/dalfox) | hahwul | MIT |
| [ffuf](https://github.com/ffuf/ffuf) | Joona Hoikkala | MIT |
| [arjun](https://github.com/s0md3v/Arjun) | Somdev Sangwan | GPLv3 |
| [wpscan](https://github.com/wpscanteam/wpscan) | WPScan Team | **WPScan Public Source License** (non-OSI; restricts commercial use) |
| [sqlmap](https://github.com/sqlmapproject/sqlmap) | sqlmap project (B. Damele, M. Stampar) | GPLv2 |
| [nikto](https://github.com/sullo/nikto) | Chris Sullo, David Lodge | GPLv2 |
| [testssl.sh](https://github.com/testssl/testssl.sh) | Dirk Wetter | GPLv2 |

Nyrax calls these tools **at arm's length** — as separate operating-system
processes, parsing their text/JSON output. It does not copy, link, or embed their
source code. Running these tools alongside AGPL-licensed Nyrax is *mere
aggregation* and affects neither project's license. Always verify each tool's exact
terms in its own repository before redistributing it.

> **wpscan** is published under the WPScan Public Source License, which is **not** a
> standard open-source license and restricts commercial use. Nyrax does not bundle or
> redistribute wpscan; it only invokes a copy the user installs. If you use wpscan for
> commercial work, review its license and obtain a WPScan API token/plan as required.

## Bundled libraries (compiled into the `nyx` binary)

These MIT-licensed libraries are part of the Nyrax binary. MIT is compatible with
Nyrax's AGPL-3.0 license.

| Library | License |
|---------|---------|
| [Bun](https://github.com/oven-sh/bun) (runtime) | MIT |
| [commander](https://github.com/tj/commander.js) | MIT |
| [zod](https://github.com/colinhacks/zod) | MIT |
| [chalk](https://github.com/chalk/chalk) | MIT |
| [@clack/prompts](https://github.com/bombshell-dev/clack) | MIT |
| [citty](https://github.com/unjs/citty) | MIT |
| [ora](https://github.com/sindresorhus/ora) | MIT |

## Methodology & data

- **OWASP** — Top 10, Web Security Testing Guide (WSTG), and API Security Top 10
  inform the vulnerability classes and testing approach.
- Public **CVE / NVD** data and the **nuclei** community templates, when nuclei is used.

## Nyrax's own license

Nyrax is licensed under **AGPL-3.0** (see [LICENSE](./LICENSE)). This file documents
the third-party work Nyrax builds on; it does not relicense that work, which stays
under the terms set by its respective authors.
