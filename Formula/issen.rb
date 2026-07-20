class Issen < Formula
  desc "Forensic super-timeline engine correlating disk and memory evidence"
  homepage "https://github.com/SecurityRonin/issen"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/issen/releases/download/v0.1.3/issen-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "65c2fec715ce50da1eab469daccce83a86b39c6f5c0b32214017474dc1549eb1"
    else
      url "https://github.com/SecurityRonin/issen/releases/download/v0.1.3/issen-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "b05c8a8e7a47989ded32e5e07fe947f544550459224663b3887421d5f29b7d6e"
    end
  end

  def install
    bin.install "issen"
  end

  test do
    assert_match "issen #{version}", shell_output("#{bin}/issen --version")
  end
end
