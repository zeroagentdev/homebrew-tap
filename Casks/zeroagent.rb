cask "zeroagent" do
  arch arm: "arm64", intel: "x64"

  version "0.7.9"
  sha256 arm:   "a8123ea4eeb794afb4a1fe41ba65a588df89216dcf1ec1bb2924b764e21f57de",
         intel: "0e73eee0ab2ccc0cdff93e54afcbed5c0d0107bf17c1f0489117c283c9c8f7c2"

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
