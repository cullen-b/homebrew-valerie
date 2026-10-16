cask "valerie" do
  version :latest
  sha256 :no_check

  url "https://github.com/cullen-b/valerie/releases/latest/download/Valerie-macos.zip",
      verified: "github.com/cullen-b/valerie/"
  name "Valerie"
  desc "Fast, configurable browser with agents built in"
  homepage "https://cullen-b.github.io/valerie/"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Valerie.app"

  zap trash: [
    "~/.config/valerie",
    "~/Library/Application Support/Valerie",
    "~/Library/Caches/dev.valerie.browser",
    "~/Library/WebKit/dev.valerie.browser",
  ]

  caveats <<~EOS
    Valerie updates itself; there's no need to `brew upgrade` it.
    Until Valerie is notarized by Apple, the first time you open it macOS may say it can't check it for malware:
    click Done, then System Settings > Privacy & Security > Open Anyway (once).
  EOS
end
