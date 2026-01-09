cask "xcsh" do
  name "xcsh"
  desc "Command-line interface for F5 Distributed Cloud"
  homepage "https://robinmordasiewicz.github.io/f5xc-xcsh"
  version "v2.0.21-2601090458"

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
      sha256 "c5edfa9295d10bf033d50c06c3bb1ed3e6260d5aa37f6a020e550a7924545487"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/#{version}/xcsh_#{version}_darwin_arm64.tar.gz"
      sha256 "dc25f1dcdb5c20bb71db222048ba7cae006acdd1079126ef5f96b9e6fbcb7cf2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/#{version}/xcsh_#{version}_linux_amd64.tar.gz"
      sha256 "691fd8d9d6666f5d832a7795474a1616e9a031a30f0413328906ad81574aef3b"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/#{version}/xcsh_#{version}_linux_arm64.tar.gz"
      sha256 "6bd5f27cb57f591938288bc1256420636358a2c2ea0446641daa208c33a7ae38"
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
