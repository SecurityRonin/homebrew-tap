class Sqlite4n6 < Formula
  desc "Read-only SQLite forensic CLI — carve deleted records, grade anomalies"
  homepage "https://github.com/SecurityRonin/sqlite-forensic"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.10.0/sqlite4n6-0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "e4396e58deec90789a57ab60d8f7333214c8ba0564e5d0ae8062c352a2799157"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.10.0/sqlite4n6-0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "4f2d594ea2acbaf75e4943aa2eb43cce82293deb5ca5bcfe7d086039427113ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.10.0/sqlite4n6-0.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "838b4918fd6b7a2c7c07b53d0b50d115540a8afac1b9ec1fad601777b8411d04"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.10.0/sqlite4n6-0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0c1be7b511bb3c0eecf9330330780396c5244d28471cb9a3e0f653924c952c4e"
    end
  end

  def install
    bin.install "sqlite4n6"
  end

  test do
    assert_match "sqlite4n6 #{version}", shell_output("#{bin}/sqlite4n6 --version")
  end
end
