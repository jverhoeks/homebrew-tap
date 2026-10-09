# Canonical Homebrew formula for the claudecounter TUI.
#
# Source of truth: release.yml fills the __PLACEHOLDERS__ from the
# published release and writes the result to Formula/claudecounter.rb in
# jverhoeks/homebrew-tap. Edit this file, not the tap copy.
class Claudecounter < Formula
  desc "Live terminal spend tracker for Claude Code, Codex and Grok"
  homepage "https://github.com/jverhoeks/claudecounter"
  version "1.12.0"

  on_macos do
    on_arm do
      url "https://github.com/jverhoeks/claudecounter/releases/download/v#{version}/claudecounter-darwin-arm64"
      sha256 "17a021b738944471a0469a264591aff65e3cd5c17a129e418e75d9bdac2da1b9"
    end
    on_intel do
      url "https://github.com/jverhoeks/claudecounter/releases/download/v#{version}/claudecounter-darwin-amd64"
      sha256 "b0057efc1241d38e9eaf38769011579cc19b43f0885ddeb93e01549032be2000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jverhoeks/claudecounter/releases/download/v#{version}/claudecounter-linux-arm64"
      sha256 "dde807303c3bed5f93dd3e6cef79c4dd9659d2c9bd12803ed9912479413d0220"
    end
    on_intel do
      url "https://github.com/jverhoeks/claudecounter/releases/download/v#{version}/claudecounter-linux-amd64"
      sha256 "846f864ae0785cb7e29e1c46639dc69c82e8aedd1220534f7aecd49558edb7a5"
    end
  end

  def install
    bin.install Dir["claudecounter-*"].first => "claudecounter"
  end

  test do
    # No --version flag; --help lists the flags and exits 0.
    assert_match "sources-config", shell_output("#{bin}/claudecounter --help 2>&1")
  end
end
