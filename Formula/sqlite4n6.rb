class Sqlite4n6 < Formula
  desc "Read-only SQLite forensic CLI — carve deleted records, grade anomalies"
  homepage "https://github.com/SecurityRonin/sqlite-forensic"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.6.0/sqlite4n6-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "916ac6cd54fd746278eb6308f6302778992f25bd44647182314e0d2096f959fe"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.6.0/sqlite4n6-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "b9448f084cda6fc3d302514cdba922bc02a6c04263db83d961f80bc95a0aa6d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.6.0/sqlite4n6-0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "51f9153a9d01c0fe1031788eabb4caf2a4ef9183e0651a6757739d3e699b42a9"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.6.0/sqlite4n6-0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "45d4c1da5426d6b48ce7949ac401aa139a7b0c86fc435acba73def29ebb51285"
    end
  end

  def install
    bin.install "sqlite4n6"
  end

  test do
    assert_match "sqlite4n6 #{version}", shell_output("#{bin}/sqlite4n6 --version")
  end
end
