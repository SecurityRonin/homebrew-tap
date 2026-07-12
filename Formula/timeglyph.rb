class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.5.0/timeglyph-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "317fa5c3c9607428808ddf9bef23e59dc38ba1e1b162bdb261764cbc8021c412"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.5.0/timeglyph-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "fcc7473bcb22a894db5a23b59858debcf2f8ff95c72d7dc634f52b271e119e2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.5.0/timeglyph-0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3d1d965a3b4905c75b0544b00dd50a8650f34f259db8116c4dcbacf876a6b83b"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.5.0/timeglyph-0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7fb2ff0a69fec623ada695e091cbd9c985a01b20d88d3a65a1bf8bc51067802b"
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
