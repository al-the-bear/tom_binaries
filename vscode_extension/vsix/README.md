# Tom AI VS Code extension — the latest VSIX

Download: <https://github.com/al-the-bear/tom_binaries/releases/download/vscode-extension-latest/tom-ai-extension.vsix>

Install it with VS Code's command line (or *Extensions: Install from VSIX…*):

```sh
code --install-extension tom-ai-extension.vsix
```

| | |
|---|---|
| Built from | tom_vscode `ade94343bcb359b13d3f7e09ff1fb0b39859979d` |
| Built at | 2026-11-11T17:52:36.535Z |
| Size | 62.8 MiB |
| Packed by | `create_vsix.sh` |

## Dart binaries carried

| Platform | Binaries | Build stamps |
|---|---|---|
| darwin-arm64 | tom_bs, validate_codespecs, spec_checks | tom_bs: 2026-11-11T17:51:08.341Z from ade9434; validate_codespecs: 2026-11-11T17:51:57.144Z from b6848658abd0; spec_checks: 2026-11-11T17:52:00.519Z from b6848658abd0 |

On linux-x64, win32-x64 the extension runs without DartScript and CodeSpecs validation (@T: Missing Dart Binaries says how to add them).

Provider SDKs (Anthropic, Agent SDK) are not in the VSIX: the extension installs them on request (Provider SDKs page).
