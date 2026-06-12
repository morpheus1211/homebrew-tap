cask "paniclock" do
  version "1.0.10"
  sha256 "de1bef154686643cf55ae52a46a65e83cccb5a5eed714384493250a83cd4547c"

  url "https://github.com/paniclock/paniclock/releases/download/v#{version}/PanicLock.dmg"
  name "PanicLock"
  desc "Touch ID screen lock utility"
  homepage "https://github.com/paniclock/paniclock"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "PanicLock.app"

  uninstall launchctl: "com.paniclock.helper",
            delete:    [
              "/Library/PrivilegedHelperTools/com.paniclock.helper",
              "/Library/LaunchDaemons/com.paniclock.helper.plist",
            ]

  zap trash: "~/Library/Preferences/com.paniclock.app.plist"
end
