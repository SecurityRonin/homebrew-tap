class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.9.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.3/timeglyph-0.9.3-aarch64-apple-darwin.tar.gz"
      sha256 "00b1f1d6f9014fa69489d851e17ea11f1c817e2f1a20308dcc0e6595649167bb"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.3/timeglyph-0.9.3-x86_64-apple-darwin.tar.gz"
      sha256 "59ec008e0f3d033948040f56c6e532730ca9c961391291e3d7f6996ffccad18e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.3/timeglyph-0.9.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3d917a51f95f79807828ae8004d6dc6e423833b53a3f03fece22243508397b54"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.3/timeglyph-0.9.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5c723a8090f04cfc9af8ca31ca0b9cf5a0b74b1117ba29dd70294b344b11f7ab"
    end
  end

  def install
    bin.install "timeglyph"
  end

  def caveats
    "The Lens GUI overlay ships as a macOS app (a /Applications icon): brew install --cask securityronin/tap/timeglyph-lens"
  end

  test do
    assert_match "timeglyph", shell_output("#{bin}/timeglyph --version")
    assert_match "2020-01-01", shell_output("#{bin}/timeglyph decode unix 1577836800")
  end
end
