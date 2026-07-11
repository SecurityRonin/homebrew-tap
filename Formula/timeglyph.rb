class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "6e3c4536988b69379c88166fb5e0d4cd3897cb7c8e178eac2f285bca2aebf78e"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "67868e62cee532a227a75ebd961c8ca6c743d5a13f0c92954d57d0ddfb4ba0cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e06d4c957850ec099d5cfdaeb228d15aa017ad644121cacf715ebf8f9c9c720a"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.4.0/timeglyph-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2da2db8754b3da7edf917548d2b62ad8297f790ecc12cc12496993c6a7455633"
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
