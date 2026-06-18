class Disk4n6 < Formula
  desc "Forensic disk analyzer — decode images & live devices, map partitions, flag anomalies"
  homepage "https://github.com/SecurityRonin/disk-forensic"
  version "0.8.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.2/disk4n6-0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "9a0b40fd826ffaca8cac895377b76417b469f0075302af03bd632b3cafb8203a"
    else
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.2/disk4n6-0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "ff35600d18895c61faf2bd5e10a580cf9136d4b3d3957ee57a4ed687031931af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.2/disk4n6-0.8.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "44238205f36c85df2682dc43f82262ba2d4d54420846449e0a4610b1f4c12eac"
    else
      url "https://github.com/SecurityRonin/disk-forensic/releases/download/v0.8.2/disk4n6-0.8.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "13e1d8b8f8b883d45c24f424b701626ead9880e327ddb89af8773eb839263c0f"
    end
  end

  def install
    bin.install "disk4n6"
  end

  test do
    assert_match "disk4n6 #{version}", shell_output("#{bin}/disk4n6 --version")
  end
end
