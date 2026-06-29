class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.3.0/timeglyph-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "f27f62c3ac102877e6fb2e2fef4ba01093b410a9dfaeeba84679e0d72d963154"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.3.0/timeglyph-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "928976b378bf9ad3a7f037996d9495fa8b4c1ee009087b04448d0f0e459951ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.3.0/timeglyph-0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d7a66fa47e6897c74c186d6e0a772b2885725fe40f40415ced8a9f1498865f8c"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.3.0/timeglyph-0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "be012ce75e2deceee1c3b9b50f532a581ff9b69fa2ab27ea2efeeb9d67633bf1"
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
