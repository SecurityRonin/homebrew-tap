class Peira < Formula
  desc "Examine a knowledge vault against classical critical-thinking gates"
  homepage "https://github.com/SecurityRonin/peira"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/peira/releases/download/v0.1.0/peira-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "bf3773672cb468ffcf0f5e98e3a0a1c645be67f46d120a09a91cd6c4cacd3974"
    else
      url "https://github.com/SecurityRonin/peira/releases/download/v0.1.0/peira-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "bdd7de6efd662791fd8742a590085fc1d04537908a44c33fbedfaadb0928da78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/peira/releases/download/v0.1.0/peira-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d74c67b6232b313a40c7a57c6d72e67e8a5d6ce60779f0892f4b2303ef37eb09"
    else
      url "https://github.com/SecurityRonin/peira/releases/download/v0.1.0/peira-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5f616410faae1bacc47df6ceda0e6413ee388bfde15b6591f073144d610bec8f"
    end
  end

  def install
    bin.install "peira"
  end

  test do
    assert_match "peira", shell_output("#{bin}/peira --version")

    # The catalogue loads. Asserted on the word rather than the count,
    # which changes every time a lens is added.
    assert_match "lenses", shell_output("#{bin}/peira lens")

    # And it does real work: scaffold a vault and check the four areas.
    system bin/"peira", "init", testpath/"vault"
    %w[60-lexicon 70-inquiry 80-examinations 90-packets].each do |area|
      assert_predicate testpath/"vault"/area, :directory?
    end
  end
end
