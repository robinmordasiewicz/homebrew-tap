cask "xcsh" do
  name "xcsh"
  desc "Command-line interface for F5 Distributed Cloud"
  homepage "https://robinmordasiewicz.github.io/f5xc-xcsh"
  version "6.25.0"

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
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/v#{version}/xcsh_#{version}_darwin_amd64.tar.gz"
      sha256 "2c87da31b8e219451b63e0fbda923b4e8062145ece97d42b9ed19dca6e9875a5"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/v#{version}/xcsh_#{version}_darwin_arm64.tar.gz"
      sha256 "36689f08e2b46b1c443857746457f4090b40e8d6c9193569a5a0e0002a39a706"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/v#{version}/xcsh_#{version}_linux_amd64.tar.gz"
      sha256 "da6c3fc3f8b4891d66e13dac674003e387295086dd1969451d7c1641070b80a1"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/v#{version}/xcsh_#{version}_linux_arm64.tar.gz"
      sha256 "d68ecbd2ad30bd2b098c0c47d5fccbcd415139999a809fee27ae32b20c8e4274"
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
