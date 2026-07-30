class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.9.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.5/timeglyph-0.9.5-aarch64-apple-darwin.tar.gz"
      sha256 "b3860bf9a7186730519a5a705aa8c0e4e8049659697c63cb6e31644f4314f3db"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.5/timeglyph-0.9.5-x86_64-apple-darwin.tar.gz"
      sha256 "53d41389f8550ef32ec647206d31c05fc935de5c45952bec9b47485d6187aa66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.5/timeglyph-0.9.5-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ceb4cadfcb03070a27c289c62beaf52f7300d58c721751056fdff6213032a0ff"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.5/timeglyph-0.9.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "73be1cb12a0ccde53ec3dcca0020b22bb7e0c15e395f9d9f784eaf9709d7b961"
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
