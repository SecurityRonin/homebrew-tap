class Sqlite4n6 < Formula
  desc "Read-only SQLite forensic CLI — carve deleted records, grade anomalies"
  homepage "https://github.com/SecurityRonin/sqlite-forensic"
  version "0.10.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.10.1/sqlite4n6-0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "b59fc19251f210498531ab0d3ca938e923d85bd0c1f420a3f979d908d1691264"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.10.1/sqlite4n6-0.10.1-x86_64-apple-darwin.tar.gz"
      sha256 "ac53b8d0b982d0b5497b608119497e83010cbb434aee9ba1c74d85e473994035"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.10.1/sqlite4n6-0.10.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "eecbf3f5050ab9208102c6e3b915c8e38a1018993700b9d7438e8b97e469dacb"
    else
      url "https://github.com/SecurityRonin/sqlite-forensic/releases/download/v0.10.1/sqlite4n6-0.10.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "78c8b5f3d5fae8d656fbb9fd70af98518e5ef700e9e4d1c7b8172607058db0ff"
    end
  end

  def install
    bin.install "sqlite4n6"
  end

  test do
    assert_match "sqlite4n6 #{version}", shell_output("#{bin}/sqlite4n6 --version")
  end
end
