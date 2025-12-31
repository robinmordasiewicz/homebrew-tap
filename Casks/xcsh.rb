cask "xcsh" do
  name "xcsh"
  desc "Command-line interface for F5 Distributed Cloud"
  homepage "https://robinmordasiewicz.github.io/f5xc-xcsh"
  version "6.42.0"

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
      sha256 "dd0234c5835469d9155b4cfea48afb6609206e9c251609b2f69f46e15f9e5ecb"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/v#{version}/xcsh_#{version}_darwin_arm64.tar.gz"
      sha256 "fa38c687f243bb7fbf7b99711b9dd29800161b9fae59270c982c887c013fd5c3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/v#{version}/xcsh_#{version}_linux_amd64.tar.gz"
      sha256 "bdced6c732125978022cfad0425ae8069912b98705347397c5b88b03e5192509"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/v#{version}/xcsh_#{version}_linux_arm64.tar.gz"
      sha256 "6db23199d0602bbae0607f74717e832abf10531876c1464f504b361f14a534f7"
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
