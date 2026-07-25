# Homebrew tap for Tidy Ports

[Tidy Ports](https://tidyports.app) is a macOS menu-bar app that shows what is running on
your local ports — and what launched it — and lets you close what you are not using.

## Install

```bash
brew install --cask dan-fetch-studio/tap/tidyports
```

Homebrew adds the tap automatically the first time; there is no separate `brew tap` step.

## Update

```bash
brew upgrade --cask tidyports
```

## Uninstall

```bash
brew uninstall --cask tidyports
```

That also unloads the privileged background helper the app installs for
keep-awake-with-the-lid-closed, which removing the app on its own would leave behind.

To remove preferences and caches as well:

```bash
brew uninstall --zap --cask tidyports
```

## What this tap installs

The same notarized, stapled DMG published on the
[releases repo](https://github.com/dan-fetch-studio/tidyports-releases/releases) — the
identical file the website serves, verified by the checksum pinned in the cask. Nothing is
rebuilt here, and nothing is repackaged.

Requires macOS 15 (Sequoia) or newer.
