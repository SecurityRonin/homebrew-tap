class Sqlite4n6 < Formula
  desc "Read-only SQLite forensic CLI — carve deleted records, grade anomalies"
  homepage "https://github.com/SecurityRonin/sqlite-forensic"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.3.0/sqlite4n6-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "bb3bfde59719728e38eff030db4b2e8504225bce86e3a7c6e0dd4e70d4ea0b4d"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.3.0/sqlite4n6-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "4dc49e0c8ffb7715a95b8ad5834350959d9592af601ddbf13257d77ec8d24086"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.3.0/sqlite4n6-0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "14daddb84692105fd93765a8f34c7d3e7d148f95e26a9e76d99cafa6bbc0a371"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.3.0/sqlite4n6-0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "edd7e5d37a0751e7547d168f9e32c0698217ba442a6f85af422efa7309b55aa6"
    end
  end

  def install
    bin.install "sqlite4n6"
  end

  test do
    assert_match "sqlite4n6 #{version}", shell_output("#{bin}/sqlite4n6 --version")
  end
end
