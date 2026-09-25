cask "convey" do
  version "0.2.2"
  sha256 "c8a648d52cef4f7e4feedb8ce483a46d45752b54b993d662d13e8f26480c9c10"

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
