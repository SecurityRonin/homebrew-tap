class Disk4n6 < Formula
  desc "Forensic disk analyzer — decode images & live devices, map partitions, flag anomalies"
  homepage "https://github.com/SecurityRonin/disk-forensic"
  version "0.8.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.5/disk4n6-0.8.5-aarch64-apple-darwin.tar.gz"
      sha256 "9ec9dd78c146eacc3a2b0d8bf3d994c8fb7fce5775adbf2b8a0f409bb3f78388"
    else
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.5/disk4n6-0.8.5-x86_64-apple-darwin.tar.gz"
      sha256 "1b902ff724d10495405a5652898e415f20e33abdf9c980e8b750a571ffbd313d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.5/disk4n6-0.8.5-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ea8cb33df111587d2b9a6d2437b7042cccb7b8d14428b7393a8913bc2910fb11"
    else
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.5/disk4n6-0.8.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "69079a30cf07f697ae7b08f0392ea3bde10ea1c83541a7056ed1b540c15ea5e6"
    end
  end

  def install
    bin.install "disk4n6"
  end

  test do
    assert_match "disk4n6 #{version}", shell_output("#{bin}/disk4n6 --version")
  end
end
