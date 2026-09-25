cask "convey" do
  version "0.2.1"
  sha256 "f53447284e8deecfa77ad37f71afad1eb16fae3a87a08e9da308be93298c4e14"

  url "https://github.com/jverhoeks/convey-clipboard/releases/download/v#{version}/Convey-v#{version}-macos-universal.zip"
  name "Convey"
  desc "Menu-bar clipboard converter with screenshots and screen recording"
  homepage "https://github.com/jverhoeks/convey-clipboard"

  depends_on macos: :ventura

  app "Convey.app"
  binary "#{appdir}/Convey.app/Contents/MacOS/convey"

  zap trash: [
    "~/Library/Application Support/Convey",
    "~/Library/LaunchAgents/convey-app.plist",
    "~/Library/Preferences/org.verhoeks.convey.plist",
  ]

  caveats do
    <<~EOS
      Convey is ad-hoc signed (not notarized). If macOS refuses to open it:
        xattr -dr com.apple.quarantine "#{appdir}/Convey.app"
      After each upgrade, switch Convey off and on again in System Settings >
      Privacy & Security > Screen & System Audio Recording.
    EOS
  end
end
