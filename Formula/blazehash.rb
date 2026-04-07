class Blazehash < Formula
  desc "Forensic file hasher — hashdeep for the modern era, BLAKE3 by default"
  homepage "https://github.com/SecurityRonin/blazehash"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/blazehash/releases/download/v0.2.1/blazehash-0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "ac47442732bc38c055e6bfbd27ec9e9d21a593346aad98ac3a434fd0b610f262"
    else
      url "https://github.com/SecurityRonin/blazehash/releases/download/v0.2.1/blazehash-0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "741288ef0eb6d4cde5c9a1f14a6e95813dd87e43239f1635ba62eb17c6bf800b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/blazehash/releases/download/v0.2.1/blazehash-0.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "55cf5287e98ce2e448c8bc9af611e94ae5dc13f333e9b70f9ee0fc0867f2ea85"
    else
      url "https://github.com/SecurityRonin/blazehash/releases/download/v0.2.1/blazehash-0.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7e3e0958ee2e1421355aab7e17239a789b819263b980802dd6ef7afaf9f79a83"
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
