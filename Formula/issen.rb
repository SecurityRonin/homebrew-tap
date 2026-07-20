class Issen < Formula
  desc "Forensic super-timeline engine correlating disk and memory evidence"
  homepage "https://github.com/SecurityRonin/issen"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/issen/releases/download/v0.1.2/issen-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "6ac3ef81a33d6ebfbb0a1b8d63289e67619431cce290e1e0143b14574bf1c790"
    else
      url "https://github.com/SecurityRonin/issen/releases/download/v0.1.2/issen-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "12436be93555b26eab18a07c0ef9ef0a8853f80efc4a120ec3f418e768789db2"
    end
  end

  def install
    bin.install "issen"
  end

  test do
    assert_match "issen #{version}", shell_output("#{bin}/issen --version")
  end
end
