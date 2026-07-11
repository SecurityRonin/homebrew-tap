class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "7427034f0f062a92007d551b501d61d373e15c304589ff264c21769ac3f59546"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "1ee52c2c75bc3b69f0a6ff30c744ac5520821eba2ad1a6448e50cb0f9c53a717"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7fa3725a8c254e5fdf1d40e53354b989b2d86b8ff83cc2a3f98c3405f5986473"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6d50f8caa55835be0a1065912f84fb857ef675f5f532f8d6d3c92983c25beff5"
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
