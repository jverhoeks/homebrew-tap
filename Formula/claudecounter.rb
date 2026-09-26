# Canonical Homebrew formula for the claudecounter TUI.
#
# Source of truth: release.yml fills the __PLACEHOLDERS__ from the
# published release and writes the result to Formula/claudecounter.rb in
# jverhoeks/homebrew-tap. Edit this file, not the tap copy.
class Claudecounter < Formula
  desc "Live terminal spend tracker for Claude Code, Codex and Grok"
  homepage "https://github.com/jverhoeks/claudecounter"
  version "1.10.0"

  on_macos do
    on_arm do
      url "https://github.com/jverhoeks/claudecounter/releases/download/v#{version}/claudecounter-darwin-arm64"
      sha256 "9c7baf0983b398a7883552183ec915dd5ea3e3491b4027693b65af17df8d9d4f"
    end
    on_intel do
      url "https://github.com/jverhoeks/claudecounter/releases/download/v#{version}/claudecounter-darwin-amd64"
      sha256 "32aa775d631d30c972a36a30bbfbda01f2420195e928494418b02e1abb25c358"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jverhoeks/claudecounter/releases/download/v#{version}/claudecounter-linux-arm64"
      sha256 "e36890ff2c25bd9c8716f81dba0d30a1f83f7e1d7c76399062341385e4aafbf4"
    end
    on_intel do
      url "https://github.com/jverhoeks/claudecounter/releases/download/v#{version}/claudecounter-linux-amd64"
      sha256 "cec06eab0576823dc7e286de70ca2493e1afa06a3f044038ec10b47c5a05760e"
    end
  end

  def install
    bin.install Dir["claudecounter-*"].first => "claudecounter"
  end

  test do
    # No --version flag; Go's flag package exits 2 on --help.
    assert_match "sources-config", shell_output("#{bin}/claudecounter --help 2>&1", 2)
  end
end
