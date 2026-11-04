class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.10.0/timeglyph-0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "860e63432a3f404a304afcc12a3e070f7ad20639b26afa669c472b2fcf886fbd"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.10.0/timeglyph-0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "943689a6a18428d03559c4ec3590df5e6096931c91611d76aa16e11f3c492b08"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.10.0/timeglyph-0.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "957effe7571b1017dbec93879e3c264ab72ea4aef52b7f811e7eae673a0f87cc"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.10.0/timeglyph-0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b3303f2aaf561bb94b9929f73ecd429a1f2c921a280b14206f35e8beadb64bd3"
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
