class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.7.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.7.1/timeglyph-0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "d686ff4c8dcf4167333257041e60a1a0d85d291efbb208b588018d54db41d6cf"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.7.1/timeglyph-0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "d185000c02d29d2a050e32919ea1b5856dd64aec04ecd881a0a5b6537dae644c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.7.1/timeglyph-0.7.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "54023ed5f1a80471a51e7ae4adb78ed8a39d7aef0ec47b0408846c21bd4abeff"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.7.1/timeglyph-0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9bf6fd1da0be4e957dbe9fe2f0b1939e0d2456044b8e0bd98755fb5e29b04663"
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
