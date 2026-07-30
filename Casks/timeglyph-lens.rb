cask "timeglyph-lens" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.9.3"
  sha256 arm:   "1643eb2d05c5e3fc80b5afb16ef8691af90ea0800485ccab4b7e4bdffb4306ba",
         intel: "ac40f1c745ffc1d6c94bf9f113ffbd443e82c288e45e3e07108864946a0be8e6"

  url "https://github.com/SecurityRonin/timeglyph/releases/download/v#{version}/timeglyph-lens-#{version}-#{arch}-apple-darwin.app.zip"
  name "TimeGlyph Lens"
  desc "Hover any on-screen number and decode its time"
  homepage "https://github.com/SecurityRonin/timeglyph"

  # NO depends_on formula: — deliberately. Homebrew 6 refuses to load a
  # formula the user did not name (an indirect depends_on) from an untrusted
  # tap, which ABORTS the whole install ("Refusing to load formula … from
  # untrusted tap"); an explicitly-named cask is trusted. The .app therefore
  # carries the CLI in Contents/MacOS and we expose it below, so
  #  is a genuine ONE-command install of CLI + GUI
  # with no  step. (The formula still ships the CLI alone.)
  app "TimeGlyph Lens.app"
  binary "#{appdir}/TimeGlyph Lens.app/Contents/MacOS/timeglyph-lens"
  binary "#{appdir}/TimeGlyph Lens.app/Contents/MacOS/timeglyph"
end
