class Sqlite4n6 < Formula
  desc "Read-only SQLite forensic CLI — carve deleted records, grade anomalies"
  homepage "https://github.com/SecurityRonin/sqlite-forensic"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.8.0/sqlite4n6-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "a3b6185e1255d12acb4a197373e39df91bea2ac493af7c26e3e76bca5bc6c39a"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.8.0/sqlite4n6-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "89c9d436ab0a920f5851a9bf771204e11687d50268f341b188cdf18be6daf589"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.8.0/sqlite4n6-0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "949bff8e5108f80061da2a5e1ffae142fc4795c961264b1866095c38c2f355ca"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.8.0/sqlite4n6-0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "67d4017c762d8cd7a35e3cd7d90c5a0f10bc6788e4d0df6f87cd128e255169bb"
    end
  end

  def install
    bin.install "sqlite4n6"
  end

  test do
    assert_match "sqlite4n6 #{version}", shell_output("#{bin}/sqlite4n6 --version")
  end
end
