class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.1/timeglyph-0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "4bee4dae3d24de15781830042cd4aae031988403b2c935bc258bfd70142b816b"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.1/timeglyph-0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "b1685a84d4805a0d0fbd37f59c9d501cf4b1754bd2dd53cd8bce28b41afb61c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.1/timeglyph-0.4.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d3df4c44f48d3fec341dee6e70fa58e68899b24246eb37f77d5bc237ad4bd2ea"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.1/timeglyph-0.4.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fcd02354bde7aafcd1c0b07940a0204927f05d177c853b831f2cff1a9fc325d0"
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
