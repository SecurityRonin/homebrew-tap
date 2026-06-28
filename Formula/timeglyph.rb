class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.2.0/timeglyph-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "658f5742eb2ff94da0329ba756ea87e12346a3bf4552954594558b00a99ea16c"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.2.0/timeglyph-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "bda5af877cfd1cdc5392fdb917c5988ec5254118cefb9f9f4d216fc5306af006"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.2.0/timeglyph-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8b680a222c128e7f6b62c92c6ad3519b84c08086680415e87b77c3c26152d31b"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.2.0/timeglyph-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "06ec2680c434292a1db7dae90a878e5d64e709dde7d13eb33149b134644aed55"
    end
  end

  def install
    bin.install "timeglyph"
  end

  test do
    assert_match "timeglyph", shell_output("#{bin}/timeglyph --version")
    assert_match "2020-01-01", shell_output("#{bin}/timeglyph decode unix 1577836800")
  end
end
