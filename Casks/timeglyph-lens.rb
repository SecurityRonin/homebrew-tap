cask "timeglyph-lens" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.10.0"
  sha256 arm:   "16a8bc7a56a81ab7e0b83cdd5992b99bc0c69bbd5685a301c7c84d5ce2b5f6ec",
         intel: "367b55dbc8e5007912b136ab2d953b2197398a5e71b9ab8a34c3796cec077a47"

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
