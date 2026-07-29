cask "timeglyph-lens" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.9.2"
  sha256 arm:   "95796e006e93fc7999f31e720116b82f257ee6ce9d419d695cf89a4bf226efb0",
         intel: "33c357573955094ecba795b529c0c025ebcfdde36d4baa408297f9fa88f27d1b"

  url "https://github.com/SecurityRonin/timeglyph/releases/download/v#{version}/timeglyph-lens-#{version}-#{arch}-apple-darwin.app.zip"
  name "TimeGlyph Lens"
  desc "Hover any on-screen number and decode its time"
  homepage "https://github.com/SecurityRonin/timeglyph"

  depends_on formula: "securityronin/tap/timeglyph"

  app "TimeGlyph Lens.app"
  binary "#{appdir}/TimeGlyph Lens.app/Contents/MacOS/timeglyph-lens"
end
