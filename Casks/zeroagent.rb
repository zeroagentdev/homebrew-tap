cask "zeroagent" do
  arch arm: "arm64", intel: "x64"

  version "0.23.0"
  sha256 arm:   "f605bd3c2b19bf0d726c0a8b08244c952e031bce2c8cf19efd6be5511f2564ab",
         intel: "d0b3f428eb8f0992e1a50f8f7979bc2184a9d8c63fa82f1eead40dc1c90f0975"

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
