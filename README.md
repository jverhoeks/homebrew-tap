# homebrew-tap

Homebrew tap for [jverhoeks](https://github.com/jverhoeks) tools.

## Install escrow

```bash
brew tap jverhoeks/tap
brew install escrow
```

### Run as a background service

```bash
brew services start escrow
# → http://localhost:7888/dashboard
```

Credentials are generated on first start and printed to:
```
$(brew --prefix)/var/log/escrow.log
```

### Stop / restart

```bash
brew services stop escrow
brew services restart escrow
```

### Uninstall

```bash
brew services stop escrow
brew uninstall escrow
```

---

## What is escrow?

A lightweight supply-chain proxy that blocks packages by age, vulnerability, and reputation before they reach developers or CI.

→ [github.com/jverhoeks/escrow](https://github.com/jverhoeks/escrow)
