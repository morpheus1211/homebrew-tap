cask "paniclock" do
  version "1.0.9"
  sha256 "b343973e34be471db57ae192689aa21e1dde20da54434fc406bfbd018d6ed515"

  url "https://github.com/paniclock/paniclock/releases/download/v#{version}/PanicLock.dmg"
  name "PanicLock"
  desc "Touch ID screen lock utility"
  homepage "https://github.com/paniclock/paniclock"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "PanicLock.app"

  uninstall launchctl: "com.paniclock.helper",
            delete:    [
              "/Library/PrivilegedHelperTools/com.paniclock.helper",
              "/Library/LaunchDaemons/com.paniclock.helper.plist",
            ]

  zap trash: "~/Library/Preferences/com.paniclock.app.plist"
end
