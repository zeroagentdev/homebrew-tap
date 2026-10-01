cask "zeroagent" do
  arch arm: "arm64", intel: "x64"

  version "0.19.6"
  sha256 arm:   "a28d6ef8c978442fa7327283e22e01ad3472dc65d85d9e3d458030a869d40ae1",
         intel: "94aa9abfeda3da073a90961f6a7442638e163be01dca846d2d552a3ddc3daf3d"

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
