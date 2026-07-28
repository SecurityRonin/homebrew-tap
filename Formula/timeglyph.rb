class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.9.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.1/timeglyph-0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "45f1475050a85be8d705da0d61b082b1533763d1eb6b1fcb9d37745fa9205698"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.1/timeglyph-0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "60f5a912ed398e7fc80cd53116ce6efb1adcad46a041f60b7208b307db42f931"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.1/timeglyph-0.9.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2cba6e2a0e35b19bbcfd8c78cadf277a052701710239783cd055e2163a59653a"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.9.1/timeglyph-0.9.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3c86e762494768c87c6c250a3b5dbbdce87d075968a6acca96ab696acfc50c7b"
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
