cask "xcsh" do
  name "xcsh"
  desc "Command-line interface for F5 Distributed Cloud"
  homepage "https://robinmordasiewicz.github.io/xcsh"
  version "6.12.0"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "xcsh"

  on_macos do
    on_intel do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_darwin_amd64.tar.gz"
      sha256 "3368fc5f662bad4736c2f86beef2b4666c8f942a84e15a456c29fd88bff5a69d"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_darwin_arm64.tar.gz"
      sha256 "93ac976e5648d4dc7d8c188da42201219c778b25ad8d2600d458aa52ec9cb023"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_linux_amd64.tar.gz"
      sha256 "5466029cb7c2a9b153dc25ac9af89027925d0f918edb1508cd2749f3e5394e35"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_linux_arm64.tar.gz"
      sha256 "a773e0a87d1f83229e099f2e2e96ff026a6ec3ba26111a19c192f12744476580"
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
