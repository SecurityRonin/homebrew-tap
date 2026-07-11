class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "3873a0018b8d461054e774d3aee45739ca49a586dbf4146434946e9761ea237e"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "028ff9b6ee9e1f789719410c4da42900ffcb2247177137855e972d0abd20e1a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b3095d5aa0de903db0012f1f5c2af9a25c37c54cd559f722369d97faeda71947"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0135785d2fb36175c1409c1fe6b5143c166b3ba3f7f175f5d4c3acf37f5458fc"
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
