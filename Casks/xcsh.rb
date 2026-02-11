cask "xcsh" do
  name "xcsh"
  desc "Command-line interface for F5 Distributed Cloud"
  homepage "https://robinmordasiewicz.github.io/f5xc-xcsh"
  version "v2.1.4-2602110839"

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
      sha256 "78fbd8c800311e65f635d1b0fcb20b7f93d4985f3dcc90e885d6e2bc0ce6eaa6"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/#{version}/xcsh_#{version}_darwin_arm64.tar.gz"
      sha256 "dbeb794f66128e5573b7b37be166bce62869d391eb275914e0262e17f0f67ce4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/#{version}/xcsh_#{version}_linux_amd64.tar.gz"
      sha256 "2b37f36c4cd3a25321781b3f5e8b57cec0b44bac1e24d47e5635c7db4aeec6d4"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/f5xc-xcsh/releases/download/#{version}/xcsh_#{version}_linux_arm64.tar.gz"
      sha256 "d00759f4ab4b18687c3c90463def987c45401c4d6f89796fc2afe05532baf599"
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
