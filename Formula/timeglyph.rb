class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.6.0/timeglyph-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "516bfb84ab1600e3155d1ad5a77c16d745c9cf05fb791f985306143f99c9c479"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.6.0/timeglyph-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "63172400e6504786862ad23cabeec13246a1dad55eccb983ffd05bb38bdd4265"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.6.0/timeglyph-0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5a84d3508bf117a8b2ede2e21cc99da1d9ffaeecbe9bf44b27580071e3847246"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.6.0/timeglyph-0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2a11ec75b082e8d344a9929587e04e85b8a2b94f70e0b01f447e2e2e72561808"
    end
  end

  def install
    bin.install "timeglyph"
    # The macOS archive also carries the lens GUI (Linux is CLI-only).
    bin.install "timeglyph-lens" if OS.mac?
  end

  test do
    assert_match "timeglyph", shell_output("#{bin}/timeglyph --version")
    assert_match "2020-01-01", shell_output("#{bin}/timeglyph decode unix 1577836800")
  end
end
