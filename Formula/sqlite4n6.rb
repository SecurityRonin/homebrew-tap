class Sqlite4n6 < Formula
  desc "Read-only SQLite forensic CLI — carve deleted records, grade anomalies"
  homepage "https://github.com/SecurityRonin/sqlite-forensic"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.4.0/sqlite4n6-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "023474874433943de63ea9f6e5bdc25295897aa814827b85cbab0575fb2f6079"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.4.0/sqlite4n6-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "c1cd6e518a102c63172801fa3064cff3b5789979e7f6c661f05f3d91d643d26d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.4.0/sqlite4n6-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bb1e57cd0f6a377026e708e8dbf858423429a5cf2d17727860f841ce739eb3d4"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.4.0/sqlite4n6-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4ad49245ac40f7102a4d261593b6af336876cac556284325a0be16f63781ed43"
    end
  end

  def install
    bin.install "sqlite4n6"
  end

  test do
    assert_match "sqlite4n6 #{version}", shell_output("#{bin}/sqlite4n6 --version")
  end
end
