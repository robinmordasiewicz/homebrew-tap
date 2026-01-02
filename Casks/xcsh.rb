cask "xcsh" do
  name "xcsh"
  desc "Command-line interface for F5 Distributed Cloud"
  homepage "https://robinmordasiewicz.github.io/f5xc-xcsh"
  version "v1.0.90-2601022220"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "xcsh"

  # Install shell completions
  postflight do
    # Bash completions
    bash_completion = "#{HOMEBREW_PREFIX}/etc/bash_completion.d"
    system_command "/bin/mkdir", args: ["-p", bash_completion]
    system_command "/bin/cp", args: ["#{staged_path}/completions/xcsh.bash", "#{bash_completion}/xcsh"]

    # Zsh completions
    zsh_completion = "#{HOMEBREW_PREFIX}/share/zsh/site-functions"
    system_command "/bin/mkdir", args: ["-p", zsh_completion]
    system_command "/bin/cp", args: ["#{staged_path}/completions/_xcsh", zsh_completion]

    # Fish completions
    fish_completion = "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d"
    system_command "/bin/mkdir", args: ["-p", fish_completion]
    system_command "/bin/cp", args: ["#{staged_path}/completions/xcsh.fish", fish_completion]
  end

  uninstall_postflight do
    # Clean up shell completions
    system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/etc/bash_completion.d/xcsh"]
    system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_xcsh"]
    system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/xcsh.fish"]
  end

  on_macos do
    on_intel do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/#{version}/xcsh_#{version}_darwin_amd64.tar.gz"
      sha256 "9c036df93f91c75641ecb08c234052bd1c654c236f87751011f263493ac6747b"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/#{version}/xcsh_#{version}_darwin_arm64.tar.gz"
      sha256 "079ee5b6867a4827970c095b5642f85bce0e5776bda3da20be5f1968d870a7c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/#{version}/xcsh_#{version}_linux_amd64.tar.gz"
      sha256 "e01a27bf2b2cbaf8e11a50c0106697a916f7b77c32dc96081c9d4081fa684eec"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/#{version}/xcsh_#{version}_linux_arm64.tar.gz"
      sha256 "985f5bbf93b4b811ca8e46c111681bc3ff21caa6ae097e8978d25b11f5d9aacb"
    end
  end

  caveats <<~EOS
    xcsh has been installed.

    Shell completions have been installed for bash, zsh, and fish.
    You may need to restart your shell or source your shell config.

    For setup instructions, see:
      https://robinmordasiewicz.github.io/f5xc-xcsh/install/homebrew/

    Quick start:
      xcsh --help
  EOS
end
