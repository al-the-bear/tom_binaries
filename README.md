# Tom Binaries

Latest version: `dev`

## Structure

```
tom/
├── darwin-arm64/    # macOS Apple Silicon
├── darwin-x64/      # macOS Intel
├── linux-x64/
├── linux-arm64/
├── linux-armhf/
└── win32-x64/       # Windows (.exe)
```

Each platform folder holds the workspace's CLI binaries (dcli, buildkit, …)
and the two binaries the VS Code extension carries:

| File | What |
| ---- | ---- |
| `tom_bs[.exe]` | the DartScript bridge (`tom_ai/vscode/tom_vscode_bridge`) |
| `tom_bs.build.json` | its build stamp: the versioner stamp it prints on start (version, build, commit), build time, platform, hash of the bridge sources it was built from (no host: the repository is public) |
| `validate_codespecs[.exe]` | CodeSpecs validation (`tom_ai/ai_build/tom_specs_clitool`) |
| `validate_codespecs.build.json` | its build stamp: the hash of the source it was built from, clitool commit, build time |
| `spec_checks[.exe]` | the TomSpecs process checks (`tom_ai/ai_build/tom_specs_clitool`) |
| `spec_checks.build.json` | its build stamp, as for `validate_codespecs` |

Those six are written by the extension's from-source builds
(`compile_and_install.sh` / `.ps1`, `create_vsix*`, and
`compile_and_install --binaries-only`): each build puts its host's platform
folder's files here, commits exactly those files and pushes, so the folder
holds the latest build of that platform's host. The multi-platform VSIX
scripts take them from here: `create_currentbinaries_vsix` (this host's built
now, the others as they are) and `create_fleetcompiled_vsix` (every fleet
platform built now on its own host), and `create_layerbinaries_vsix`, which
builds the VSIX from the extension's source with every platform's binaries
from here and needs no Dart SDK (without a checkout of this repository it
clones it). `npm run binaries:report` in the extension says, per platform,
which binaries are older than the sources. See
`tom_ai/vscode/tom_vscode_extension/README.md` § Private distribution.

## The VS Code extension as a download

The latest VSIX of the extension is not committed here (GitHub refuses files
over 100 MiB, and every version would stay in the history): it is the asset
`tom-ai-extension.vsix` of the release `vscode-extension-latest`,
<https://github.com/al-the-bear/tom_binaries/releases/download/vscode-extension-latest/tom-ai-extension.vsix>.
Every `create_*_vsix` script of the extension replaces it, and writes
[`vscode_extension/vsix/README.md`](vscode_extension/vsix/README.md): the
commit it was built from, size, script, and the platforms whose Dart binaries
it carries. Install it with `code --install-extension tom-ai-extension.vsix`.

## sqlite-vec extension

Tom Brain's memory store loads the [`sqlite-vec`](https://github.com/asg017/sqlite-vec)
extension for vector search and refuses to boot without it. The loadable
binaries are shipped here under `sqlite_vec/`, in the platform-tuple folders the
`SqliteVecBinaryResolver` expects (`MemoryConfig.sqliteVec.binariesRoot` points
at this `sqlite_vec/` directory):

```
sqlite_vec/
├── darwin-arm64/vec0.dylib   # macOS Apple Silicon
├── darwin-x64/vec0.dylib     # macOS Intel
├── linux-x64/vec0.so
├── linux-arm64/vec0.so
└── win32-x64/vec0.dll
```

Version `0.1.9`, extracted from the upstream `*-loadable-*` release tarballs.

The upstream licence texts (MIT or Apache-2.0, at the user's choice) are in
`sqlite_vec/LICENSE-MIT` and `sqlite_vec/LICENSE-APACHE`.

## What may go in

The rule (DP-204 (c) of the Tom Secrets Manager idea, 2026-11-12): a binary
may go in when its licence is not copyleft - BSD, MIT, Apache and the like,
licences that require no source to be published and bind nothing the binary is
combined with - whether its source repository is public or private; GPL and
other copyleft binaries stay out. Every binary has a row in [LICENSE](LICENSE)
naming its package, its source repository (a private one marked as such) and
its licence.

## Using the binaries without Dart

This repository is public so that a machine without a Dart SDK can use the
prebuilt programs: clone it (or download a platform folder) and put
`tom/<platform>/` on `PATH`, or let the VS Code extension's packaging take
`tom_bs` and `validate_codespecs` from here (see
[`tom_vscode_extension/README.md`](https://github.com/al-the-bear/tom_vscode/blob/main/tom_vscode_extension/README.md)
§ Private distribution). Each platform folder holds the latest build of the
host that builds that platform; the history is not kept (it was cleared when
the repository became public on 2026-11-09), so a refresh replaces the files.

## Licence

These are compiled programs; each one is licensed under the licence of the
package it is built from, which is in that package's `LICENSE` file in its
source repository. None of them is under a copyleft licence (see "What may go
in"). [LICENSE](LICENSE) maps every binary to its package, source repository
(public or private) and licence (all BSD 3-Clause today), names the bundled
third-party code (sqlite-vec, MIT or Apache-2.0) and carries the BSD 3-Clause
licence of this repository's own scripts.

## Disclaimer

This software is provided "as is", without warranty of any kind, express or
implied, including but not limited to the warranties of merchantability and
fitness for a particular purpose. In no event shall the authors, copyright
holders or contributors be liable for any claim, damages or other liability
arising from, out of or in connection with the software or its use. This
section summarises the warranty and liability disclaimer of the licences;
the licence texts referred to in [LICENSE](LICENSE) govern.
