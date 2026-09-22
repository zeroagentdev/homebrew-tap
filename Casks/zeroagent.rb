cask "zeroagent" do
  arch arm: "arm64", intel: "x64"

  version "0.9.1"
  sha256 arm:   "0379cfe3937be6c1f9fe724fbddf59eea143b1eac84be91eeba14fee3894f1d3",
         intel: "81db22555b59a03e3bd784c9f1001987bcbe68343753d9e66cafe0e00c1c013f"

  url "https://releases.zeroagenthq.com/ZeroAgent-#{version}-#{arch}.dmg"
  name "ZeroAgent"
  desc "Desktop workspace where a lead agent dispatches work to worker agents"
  homepage "https://zeroagenthq.com"

  livecheck do
    url "https://releases.zeroagenthq.com/latest-mac.yml"
    regex(/^version:\s*([\d.]+)/i)
  end

  # The app checks the same release feed on its own and updates itself
  # (ZA-148), so brew should never try to manage that part.
  auto_updates true
  depends_on macos: :ventura

  app "ZeroAgent.app"

  zap trash: [
    "~/Library/Application Support/ZeroAgent",
    "~/Library/Caches/com.mvplean.zeroagent",
    "~/Library/Logs/ZeroAgent",
    "~/Library/Preferences/com.mvplean.zeroagent.plist",
    "~/Library/Saved Application State/com.mvplean.zeroagent.savedState",
  ]
end
