class Sqlite4n6 < Formula
  desc "Read-only SQLite forensic CLI — carve deleted records, grade anomalies"
  homepage "https://github.com/SecurityRonin/sqlite-forensic"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.2.0/sqlite4n6-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "caca0c6d14190928022d545487507579812d3f5b35ec3bd7e4e346baec582bf7"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.2.0/sqlite4n6-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "7eeefcfa1978f61761441ecf57ea6f9b83f97d1c6530819899f018945e6c39c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.2.0/sqlite4n6-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dead15c802a9e1769dd7dd4165d1a7b8888d7035cf801b298d719591286905bd"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.2.0/sqlite4n6-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b9acc1bc0cb44ea54a6ab72e98543a9df45b78224ca671c34549fe755e54b4b4"
    end
  end

  def install
    bin.install "sqlite4n6"
  end

  test do
    assert_match "sqlite4n6 #{version}", shell_output("#{bin}/sqlite4n6 --version")
  end
end
