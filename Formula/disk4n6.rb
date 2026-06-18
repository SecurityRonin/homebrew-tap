class Disk4n6 < Formula
  desc "Forensic disk analyzer — decode images & live devices, map partitions, flag anomalies"
  homepage "https://github.com/SecurityRonin/disk-forensic"
  version "0.8.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.3/disk4n6-0.8.3-aarch64-apple-darwin.tar.gz"
      sha256 "fd16985a90b332278a4717bf82132d871bda4680c3c678c6828ba264545cfeec"
    else
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.3/disk4n6-0.8.3-x86_64-apple-darwin.tar.gz"
      sha256 "3b3c250e61fd6968e6883e1f115b2548bcffee64b2ccd7f068c48b6a40f9f95c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.3/disk4n6-0.8.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "32590e0f51c1465683a97c04a69684f06132f9b40c5f0ffca47a68b056b34c9f"
    else
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.3/disk4n6-0.8.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4550287b781554e26122b0786b09b938a92fb3e6b10fbbd99dbf48fe630dc4b5"
    end
  end

  def install
    bin.install "disk4n6"
  end

  test do
    assert_match "disk4n6 #{version}", shell_output("#{bin}/disk4n6 --version")
  end
end
