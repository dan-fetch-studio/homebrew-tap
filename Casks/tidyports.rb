cask "tidyports" do
  version "1.3.0"
  sha256 "10f25d7e103b383b5a89028a649900208019cc5020843f2e0d5ea83981de6369"

  # Versioned asset, not the unversioned TidyPorts.dmg: a cask pins a checksum, so it must
  # point at a URL whose bytes never change. The unversioned copy exists for the website's
  # permanent download link and is overwritten every release — checksumming it would break
  # the cask on the next one.
  url "https://github.com/dan-fetch-studio/tidyports-releases/releases/download/v#{version}/TidyPorts-#{version}.dmg",
      verified: "github.com/dan-fetch-studio/tidyports-releases/"
  name "Tidy Ports"
  desc "Menu-bar app for seeing what is running on local ports and closing it safely"
  homepage "https://tidyports.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia # Info.plist LSMinimumSystemVersion is 15.0

  app "Tidy Ports.app"

  # The app registers a privileged LaunchDaemon (SMAppService) for keep-awake-with-the-lid-
  # closed. Deleting the bundle alone would leave launchd holding a job that points at a
  # path that no longer exists, so uninstall unloads it explicitly.
  uninstall launchctl: "app.tidyports.mac.awakehelper",
            quit:      "app.tidyports.mac"

  zap trash: [
    "~/Library/Caches/app.tidyports.mac",
    "~/Library/HTTPStorages/app.tidyports.mac",
    "~/Library/Preferences/app.tidyports.mac.plist",
    "~/Library/Saved Application State/app.tidyports.mac.savedState",
  ]
end
