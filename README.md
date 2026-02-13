# Security Ronin Homebrew Tap

Homebrew formulae for Security Ronin tools.

## Install

```bash
brew tap securityronin/tap
brew install pipeguard
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| [pipeguard](https://github.com/SecurityRonin/pipeguard) | Defend against curl\|bash attacks with multi-layer shell interception |

## After Installation

Activate PipeGuard shell protection by adding to your `~/.zshrc` or `~/.bashrc`:

```bash
source $(brew --prefix)/share/pipeguard/shell/init.sh
```

Then restart your shell.
