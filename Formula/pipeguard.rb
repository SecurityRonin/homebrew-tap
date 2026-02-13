class Pipeguard < Formula
  desc "Defend against curl|bash attacks with multi-layer shell interception"
  homepage "https://github.com/SecurityRonin/pipeguard"
  url "https://github.com/SecurityRonin/pipeguard/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
      To activate PipeGuard shell protection, add to your shell RC file:

        # For zsh (~/.zshrc):
        export PATH="#{HOMEBREW_PREFIX}/bin:$PATH"
        source #{opt_share}/pipeguard/shell/init.sh

        # For bash (~/.bashrc):
        export PATH="#{HOMEBREW_PREFIX}/bin:$PATH"
        source #{opt_share}/pipeguard/shell/init.sh

      Then restart your shell or run:
        source ~/.zshrc  # or ~/.bashrc

      YARA rules are installed at:
        #{opt_share}/pipeguard/rules/core.yar

      Configure PipeGuard:
        pipeguard config init
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
