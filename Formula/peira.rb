class Peira < Formula
  desc "Examine a knowledge vault against classical critical-thinking gates"
  homepage "https://github.com/SecurityRonin/peira"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/peira/releases/download/v0.2.0/peira-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "7c8731fda43c55decfde54c5ca6a4b8daf2aa305212fed8039cb625fa26ce172"
    else
      url "https://github.com/SecurityRonin/peira/releases/download/v0.2.0/peira-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "ff20852817af4f53cf7250fcf008a54405f0476504aa8d37aa8129877fc80872"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/peira/releases/download/v0.2.0/peira-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b920823c4d864bf99abb369cb0f0f563d90058deb8fb5e2239d4a1bfc3885ef7"
    else
      url "https://github.com/SecurityRonin/peira/releases/download/v0.2.0/peira-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7dad83183f5beeeaec28b970395704e0bbf574ea3353269cae3e25efae9be6ed"
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
