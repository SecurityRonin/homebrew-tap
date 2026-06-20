class Sqlite4n6 < Formula
  desc "Read-only SQLite forensic CLI — carve deleted records, grade anomalies"
  homepage "https://github.com/SecurityRonin/sqlite-forensic"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.5.0/sqlite4n6-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "d189f108f079cdbac4c90a302837e9100a59f9105ce226c03b3241e4f83eb407"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.5.0/sqlite4n6-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "533e5740510cc6c1d52ab12e0ec73e645b64295bfc6b5507882f49ffbe9cf26c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.5.0/sqlite4n6-0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7ff8b5054430aca996157e65f4b0bd9fc62cabe0bf01a176abeaeae2faeed090"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.5.0/sqlite4n6-0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5cf6175c4693ad525974b0d1497dcd3cb83aac34b5201daa89e363bb1c3f1bd4"
    end
  end

  def install
    bin.install "sqlite4n6"
  end

  test do
    assert_match "sqlite4n6 #{version}", shell_output("#{bin}/sqlite4n6 --version")
  end
end
