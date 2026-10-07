# Canonical Homebrew formula for the claudecounter TUI.
#
# Source of truth: release.yml fills the __PLACEHOLDERS__ from the
# published release and writes the result to Formula/claudecounter.rb in
# jverhoeks/homebrew-tap. Edit this file, not the tap copy.
class Claudecounter < Formula
  desc "Live terminal spend tracker for Claude Code, Codex and Grok"
  homepage "https://github.com/jverhoeks/claudecounter"
  version "1.11.0"

  on_macos do
    on_arm do
      url "https://github.com/jverhoeks/claudecounter/releases/download/v#{version}/claudecounter-darwin-arm64"
      sha256 "cab702b95060f2788d9847d3cf9c84015f7a8402f149638c7de199ff84e089cf"
    end
    on_intel do
      url "https://github.com/jverhoeks/claudecounter/releases/download/v#{version}/claudecounter-darwin-amd64"
      sha256 "32ba0dee84348796879282e6f93ed0c0b983181237ff6481f0d498fc20682847"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jverhoeks/claudecounter/releases/download/v#{version}/claudecounter-linux-arm64"
      sha256 "1ae65617a1ce995f085c449a97602c24055a779fa92ae751e5a1e2cd9c8663e5"
    end
    on_intel do
      url "https://github.com/jverhoeks/claudecounter/releases/download/v#{version}/claudecounter-linux-amd64"
      sha256 "a8c1bc4eddfb295eb880a66131ab09b27334cbf9afecbfe04f47d2ed7254090f"
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
