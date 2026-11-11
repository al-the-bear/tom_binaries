# Tom AI VS Code extension — the latest VSIX

Download: <https://github.com/al-the-bear/tom_binaries/releases/download/vscode-extension-latest/tom-ai-extension.vsix>

Install it with VS Code's command line (or *Extensions: Install from VSIX…*):

```sh
code --install-extension tom-ai-extension.vsix
```

| | |
|---|---|
| Built from | tom_vscode `857d03e89bd9712a028a69b71c5a74afad7d0396` |
| Built at | 2026-11-11T18:54:15.583Z |
| Size | 95.9 MiB |
| Packed by | `create_currentbinaries_vsix.sh` |

## Dart binaries carried

| Platform | Binaries | Build stamps |
|---|---|---|
| darwin-arm64 | tom_bs, validate_codespecs, spec_checks | tom_bs: 2026-11-11T18:52:08.670Z from 857d03e; validate_codespecs: 2026-11-11T18:52:52.349Z from b6848658abd0; spec_checks: 2026-11-11T18:52:56.051Z from b6848658abd0 |
| linux-x64 | tom_bs, validate_codespecs, spec_checks | tom_bs: 2026-11-11T17:58:06.023Z from 14e2a1b; validate_codespecs: 2026-11-11T17:59:10.693Z from b6848658abd0; spec_checks: 2026-11-11T17:59:15.258Z from b6848658abd0 |
| win32-x64 | tom_bs, validate_codespecs, spec_checks | tom_bs: 2026-11-11T17:39:57.362Z from 14e2a1b; validate_codespecs: 2026-11-11T17:40:54.601Z from b6848658abd0; spec_checks: 2026-11-11T17:40:58.252Z from b6848658abd0 |

Provider SDKs (Anthropic, Agent SDK) are not in the VSIX: the extension installs them on request (Provider SDKs page).
