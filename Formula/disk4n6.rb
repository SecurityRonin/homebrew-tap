class Disk4n6 < Formula
  desc "Forensic disk analyzer — decode images & live devices, map partitions, flag anomalies"
  homepage "https://github.com/SecurityRonin/disk-forensic"
  version "0.8.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.4/disk4n6-0.8.4-aarch64-apple-darwin.tar.gz"
      sha256 "be5d99f856835ec56c6bb549b181c049972a18b58fa462c7ce45b50adcb53858"
    else
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.4/disk4n6-0.8.4-x86_64-apple-darwin.tar.gz"
      sha256 "4853f9eefb66a94c523f9df6d9840a4cf7ba6c4589bfd4034b129bc7b142eec0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.4/disk4n6-0.8.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ff2b3451f04122336b158b2eb2c0a80e86144592829e92dbe37985d69dfb30b0"
    else
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.4/disk4n6-0.8.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "120228020c2a042cf8ff19b48ee347b6ed5f60b7c38cf3d659c870556ee4540a"
    end
  end

  def install
    bin.install "disk4n6"
  end

  test do
    assert_match "disk4n6 #{version}", shell_output("#{bin}/disk4n6 --version")
  end
end
