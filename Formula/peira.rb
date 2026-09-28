class Peira < Formula
  desc "Examine a knowledge vault against classical critical-thinking gates"
  homepage "https://github.com/SecurityRonin/peira"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/peira/releases/download/v0.2.1/peira-0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "3ac57675ad8cfeb180860f59ddbdca930d9271deb9ff5a3f46c2a089736a824c"
    else
      url "https://github.com/SecurityRonin/peira/releases/download/v0.2.1/peira-0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "9f1bbf757b10025cf34ef438f1a436c8368303fac18aa2090bbdc91a83fe5f00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/peira/releases/download/v0.2.1/peira-0.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "521afe9e98bb0e196a7f0cc1eb44fa34ae4aee4622bfc9c446ec2ecb31fb58bb"
    else
      url "https://github.com/SecurityRonin/peira/releases/download/v0.2.1/peira-0.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cd7a72d5aed2d4ac0a34fff4fd914cc883d9847264a888bcb44049e43afbe29e"
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
