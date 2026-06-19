class Sqlite4n6 < Formula
  desc "Read-only SQLite forensic CLI — carve deleted records, grade anomalies"
  homepage "https://github.com/SecurityRonin/sqlite-forensic"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.1.2/sqlite4n6-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "a2345fbed823c1da07e5f2dca47b9bac70e8a22d0a9cb5d9ff96c42ad08e9edb"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.1.2/sqlite4n6-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "48f29a022df08244f8dee1d8121d7efd905da4af656dcde1627f676780911556"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.1.2/sqlite4n6-0.1.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6906c72747084d005227ca40fa1f71ebd7a78255f6cc207526d24dd69117e6df"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.1.2/sqlite4n6-0.1.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "18d469893463e5405094dd392a230d394b60f6cb97ed15e3f23f163c90f33189"
    end
  end

  def install
    bin.install "sqlite4n6"
  end

  test do
    assert_match "sqlite4n6 #{version}", shell_output("#{bin}/sqlite4n6 --version")
  end
end
