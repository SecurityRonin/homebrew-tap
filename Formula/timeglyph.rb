class Timeglyph < Formula
  desc "Forensic timestamp decipherment — scored, cited, ambiguity-first"
  homepage "https://github.com/SecurityRonin/timeglyph"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.7.0/timeglyph-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "cf222cd8312270b36401c3eadef2f1b09896adff47d9a4ad2de42d597866673d"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.7.0/timeglyph-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "68236574c5b52442257458d13a9441879f2f116c992da45edba916f159b0ae7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.7.0/timeglyph-0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4c5973c4149b52cc3920bbc65407d481e4eaf547866cfb6762f95c2afca9651a"
    else
      url "https://github.com/SecurityRonin/timeglyph/releases/download/v0.7.0/timeglyph-0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a561f03c632ce5181094d5cba64c2167624ff9ee791c84dd58db9ee31de369dc"
    end
  end

  def install
    bin.install "timeglyph"
    # The macOS archive also carries the lens GUI (Linux is CLI-only).
    bin.install "timeglyph-lens" if OS.mac?
  end

  test do
    assert_match "timeglyph", shell_output("#{bin}/timeglyph --version")
    assert_match "2020-01-01", shell_output("#{bin}/timeglyph decode unix 1577836800")
  end
end
