# Canonical Homebrew cask for the ClaudeCounterBar menu bar app.
#
# Source of truth: release.yml fills the __PLACEHOLDERS__ from the
# published release and writes the result to Casks/claudecounter-bar.rb
# in jverhoeks/homebrew-tap. Edit this file, not the tap copy.
cask "claudecounter-bar" do
  version "1.11.0"
  sha256 "145248933202b7cc58c7779d71d67ee930f56bc5beae094b693fbc6d89d25be4"

  url "https://github.com/jverhoeks/claudecounter/releases/download/v#{version}/ClaudeCounterBar-v#{version}-macos-arm64.zip"
  name "Claude Counter"
  desc "Menu bar spend tracker and dashboard for Claude Code, Codex and Grok"
  homepage "https://github.com/jverhoeks/claudecounter"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ClaudeCounterBar.app"

  uninstall quit: "com.jverhoeks.claudecounter-bar"

  zap trash: [
    "~/Library/Application Support/claudecounter-bar",
    "~/Library/Preferences/com.jverhoeks.claudecounter-bar.plist",
  ]

  caveats <<~EOS
    ClaudeCounterBar is ad-hoc signed (not notarized). If macOS refuses to open it:
      xattr -dr com.apple.quarantine "#{appdir}/ClaudeCounterBar.app"
  EOS
end
