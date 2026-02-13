class Pipeguard < Formula
  desc "Defend against curl|bash attacks with multi-layer shell interception"
  homepage "https://github.com/SecurityRonin/pipeguard"
  url "https://github.com/SecurityRonin/pipeguard/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6cbd30a581b4590e73d2b5d6b785fc099a254f0129eb6515f34d2937c1847ed4"
  license "MIT"

  depends_on "rust" => :build
  depends_on "yara"

  def install
    # Set YARA library path for the Rust build
    ENV["YARA_LIBRARY_PATH"] = Formula["yara"].opt_lib.to_s

    system "cargo", "install", *std_cargo_args

    # Install shell integration files
    (share/"pipeguard/shell").install "shell/init.sh"
    (share/"pipeguard/shell").install "shell/pipeguard.zsh"
    (share/"pipeguard/shell").install "shell/pipeguard.bash"
    (share/"pipeguard/shell").install "shell/content-filter.sh"

    # Install YARA rules
    (share/"pipeguard/rules").install "rules/core.yar"
  end

  def caveats
    <<~EOS
      PipeGuard requires one manual step to activate shell protection.
      We don't modify your dotfiles automatically — informed consent
      before code runs in your shell is kind of our whole thing.

      Add this line to your shell RC file:

        # For zsh (add to ~/.zshrc):
        source #{opt_share}/pipeguard/shell/init.sh

        # For bash (add to ~/.bashrc):
        source #{opt_share}/pipeguard/shell/init.sh

      Then restart your shell or run:
        source ~/.zshrc  # or ~/.bashrc

      Verify it's working:
        pipeguard-status

      YARA rules installed at:
        #{opt_share}/pipeguard/rules/core.yar
    EOS
  end

  test do
    # Verify binary runs
    assert_match "pipeguard", shell_output("#{bin}/pipeguard --help")

    # Verify YARA scanning works
    output = shell_output("echo 'echo hello' | #{bin}/pipeguard scan --rules #{share}/pipeguard/rules/core.yar 2>&1", 0)
    assert_match(/clean|no threats/i, output)
  end
end
