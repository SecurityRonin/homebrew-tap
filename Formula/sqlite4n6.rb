class Sqlite4n6 < Formula
  desc "Read-only SQLite forensic CLI — carve deleted records, grade anomalies"
  homepage "https://github.com/SecurityRonin/sqlite-forensic"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.1.0/sqlite4n6-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "7aaba7878d5a9e5a9041af3fe783a7a4a482bcc8dc1fe31c796e6352d815aba5"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.1.0/sqlite4n6-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "65724ca1ba2cda972ffded01e3632824a6addcd60596585cb12cb9c1d8e72548"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.1.0/sqlite4n6-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c623ac647b315364ee479e5afd439c39ac8cede549dd7c1b1dc85290dc85e751"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.1.0/sqlite4n6-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "968b25eb92a03c24d6e9b6278e2f9368b872e73ebbdddb07d528b03737b62afa"
    end
  end

  def install
    bin.install "sqlite4n6"
  end

  test do
    assert_match "sqlite4n6 #{version}", shell_output("#{bin}/sqlite4n6 --version")
  end
end
