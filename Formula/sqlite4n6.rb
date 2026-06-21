class Sqlite4n6 < Formula
  desc "Read-only SQLite forensic CLI — carve deleted records, grade anomalies"
  homepage "https://github.com/SecurityRonin/sqlite-forensic"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.7.0/sqlite4n6-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "3e91d84e9fe8a06792c30418300243d5a3daae574654a80a4a0dddfbbbc32ab2"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.7.0/sqlite4n6-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "6ef6e9d9ab7dfdef0ce4b97fea8bb1d08fab883198bc55752336bb725974145f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.7.0/sqlite4n6-0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e4bd60d356f22bc88cac3be4b251f96fc366ba545e328ff9241649dff4084f0f"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.7.0/sqlite4n6-0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d936391cddd36af69685063e4c5995f181b04bfddea6fccee9ab81e79b7f8072"
    end
  end

  def install
    bin.install "sqlite4n6"
  end

  test do
    assert_match "sqlite4n6 #{version}", shell_output("#{bin}/sqlite4n6 --version")
  end
end
