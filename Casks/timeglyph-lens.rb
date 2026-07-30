cask "timeglyph-lens" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.9.5"
  sha256 arm:   "c2f03b8423dcbc90d2085c0736f32d26b0f1c7030741ae32804bc35cfae484c0",
         intel: "df1d117b0fb16e55e27957b760020e64b85617022443e21afab3b96252d01556"

  url "https://github.com/SecurityRonin/timeglyph/releases/download/v#{version}/timeglyph-lens-#{version}-#{arch}-apple-darwin.app.zip"
  name "TimeGlyph Lens"
  desc "Hover any on-screen number and decode its time"
  homepage "https://github.com/SecurityRonin/timeglyph"

  # NO depends_on formula: — deliberately. Homebrew 6 refuses to load a
  # formula the user did not name (an indirect depends_on) from an untrusted
  # tap, which ABORTS the whole install ("Refusing to load formula … from
  # untrusted tap"); an explicitly-named cask is trusted. The .app therefore
  # carries the CLI in Contents/MacOS and we expose it below, so
  # "brew install --cask ..." is a genuine ONE-command install of CLI + GUI
  # with no "brew trust" step. (The formula still ships the CLI alone.)
  app "TimeGlyph Lens.app"
  binary "#{appdir}/TimeGlyph Lens.app/Contents/MacOS/timeglyph-lens"
  binary "#{appdir}/TimeGlyph Lens.app/Contents/MacOS/timeglyph"
end
