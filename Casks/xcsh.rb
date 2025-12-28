cask "xcsh" do
  name "xcsh"
  desc "Command-line interface for F5 Distributed Cloud"
  homepage "https://robinmordasiewicz.github.io/xcsh"
  version "6.14.0"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "xcsh"

  on_macos do
    on_intel do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_darwin_amd64.tar.gz"
      sha256 "edf530df9c58c77843f66ae6debf39b1b2138437f54e91e06a56e70702fa52dc"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_darwin_arm64.tar.gz"
      sha256 "acfbcdfe5c72432aa49bd2348c62188c233bd4cc07992e28ac2110b569c81947"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_linux_amd64.tar.gz"
      sha256 "4ad9ebb2cc629753372fa2e0338621182e848e59df07ce2956a3b1c278713531"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_linux_arm64.tar.gz"
      sha256 "3d2b876133b65148a059021bb6fc0002865e57f3752a0bc65e519b1e2c8c05ee"
    end
  end

  caveats <<~EOS
    xcsh has been installed.

    For setup instructions, see:
      https://robinmordasiewicz.github.io/xcsh/install/homebrew/

    Quick start:
      xcsh --help
  EOS
end
