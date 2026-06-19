class Sqlite4n6 < Formula
  desc "Read-only SQLite forensic CLI — carve deleted records, grade anomalies"
  homepage "https://github.com/SecurityRonin/sqlite-forensic"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.1.1/sqlite4n6-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "225343f30bd3c929657b1588a535be759a60e0632126d8467b1c59c9fc3ca98f"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.1.1/sqlite4n6-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "8b315f3e6e707112d5467b9618ce759f47d6963664e12269a618a49323b6a0c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.1.1/sqlite4n6-0.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9f85b6f55ac7ba6ba781a593f7c0774300aa1275b36762f45d5c441f864cd7cc"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.1.1/sqlite4n6-0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "49aad15a99e7d0dcead86baec6c60c843c65e051c2a97c77677f4c5efe887fb5"
    end
  end

  def install
    bin.install "sqlite4n6"
  end

  test do
    assert_match "sqlite4n6 #{version}", shell_output("#{bin}/sqlite4n6 --version")
  end
end
