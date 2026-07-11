class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "6540a4c8794e02dd83171bf23e50b0278f9220dab8668c68a70b4f68cd43a767"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "cd70ade66aacb63f3f8813859861da53d0cd3fa2ef69cc12d5053132ea13c5a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7d7f3ffc9735adb3c657a04f3c1587fcf539703455b380e1cd3dadc035514932"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2c62d886d2ed768b41d1352c3091fa821da121d46341626fcf83d64d36bfd0a5"
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
