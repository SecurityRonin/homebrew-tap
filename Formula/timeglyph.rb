class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.9.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.2/timeglyph-0.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "ef85f58009b67cc3b5f3c1ee2859ae15503b4b3dcc96859d5db143280e3e3f99"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.2/timeglyph-0.9.2-x86_64-apple-darwin.tar.gz"
      sha256 "2ff51a1585831b7a791273b49cec2a4406bc5e7c2a99d529c09385d098cb94e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.2/timeglyph-0.9.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "890cdf8584e137bfeabb4ba2c700581b37f8bac562bd4f4ecf45f7da706ae3ae"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.2/timeglyph-0.9.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d02f72e6e7f096e48549879a5d2d73e0b60267ea052ddd59b42de7a6ae9ee203"
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
