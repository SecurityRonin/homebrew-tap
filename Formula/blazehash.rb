class Blazehash < Formula
  desc "Forensic file hasher — hashdeep for the modern era, BLAKE3 by default"
  homepage "https://github.com/SecurityRonin/blazehash"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/blazehash/releases/download/v0.1.0/blazehash-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/SecurityRonin/blazehash/releases/download/v0.1.0/blazehash-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/blazehash/releases/download/v0.1.0/blazehash-aarch64-unknown-linux-musl.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/SecurityRonin/blazehash/releases/download/v0.1.0/blazehash-x86_64-unknown-linux-musl.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "blazehash"
  end

  test do
    assert_match "blazehash", shell_output("#{bin}/blazehash --version")

    (testpath/"test.txt").write("blazehash test content")
    output = shell_output("#{bin}/blazehash #{testpath}/test.txt")
    assert_match "test.txt", output
  end
end
