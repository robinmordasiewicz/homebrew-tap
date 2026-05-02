cask "xcsh" do
  name "xcsh"
  desc "Command-line interface for F5 Distributed Cloud"
  homepage "https://robinmordasiewicz.github.io/f5xc-xcsh"
  version "v2.1.82-2605020710"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "xcsh"

  # Install shell completions and check for conflicts
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

    # Check for conflicting installations
    conflict_locations = [
      File.expand_path("~/.local/bin/xcsh"),
      "/usr/local/bin/xcsh"
    ]
    conflicts = conflict_locations.select { |path| File.exist?(path) }
    unless conflicts.empty?
      opoo "Conflicting xcsh installations detected:"
      conflicts.each { |path| opoo "  #{path}" }
      opoo "These may shadow the Homebrew installation."
      opoo "Run: which xcsh && xcsh --version"
    end
  end

  uninstall_postflight do
    # Clean up shell completions
    system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/etc/bash_completion.d/xcsh"]
    system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_xcsh"]
    system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/xcsh.fish"]

    # Check for other installations that may still exist
    other_locations = [
      File.expand_path("~/.local/bin/xcsh"),
      "/usr/local/bin/xcsh"
    ]
    remaining = other_locations.select { |path| File.exist?(path) }
    unless remaining.empty?
      opoo "Other xcsh installations still exist:"
      remaining.each { |path| opoo "  #{path}" }
      opoo "To completely remove xcsh, also delete these files."
    end
  end

  on_macos do
    on_intel do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/#{version}/xcsh_#{version}_darwin_amd64.tar.gz"
      sha256 "ce7c41c515514ee2875fea7ec46e0dd6f36b4c3c60e425c035e4502e6e4a3101"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/#{version}/xcsh_#{version}_darwin_arm64.tar.gz"
      sha256 "1a31f8e022ee3181f32e6e976340913902d38c6adfa8b40ba1d4baf4f0c3a8b3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/#{version}/xcsh_#{version}_linux_amd64.tar.gz"
      sha256 "c882d5662c2c6152818fc30b94b23bd5e604825a338ae3260ddb0244b75c66ef"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/#{version}/xcsh_#{version}_linux_arm64.tar.gz"
      sha256 "6294abfe17d34bc084ec7d11a932516edc2bfa00dc8995c09c52cb868fb3732f"
    end
  end

  caveats <<~EOS
    xcsh has been installed to #{HOMEBREW_PREFIX}/bin/xcsh

    Shell completions have been installed for bash, zsh, and fish.
    You may need to restart your shell or source your shell config.

    PATH CONFLICT CHECK:
    If you previously installed xcsh via install.sh or another method,
    verify which version is active:
      which xcsh && xcsh --version

    If the active binary is not in #{HOMEBREW_PREFIX}/bin, you may have
    a conflicting installation. Remove old binaries from:
      ~/.local/bin/xcsh
      /usr/local/bin/xcsh

    For setup instructions, see:
      https://robinmordasiewicz.github.io/f5xc-xcsh/install/homebrew/

    Quick start:
      xcsh --help
  EOS
end
