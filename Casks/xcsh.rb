cask "xcsh" do
  name "xcsh"
  desc "Command-line interface for F5 Distributed Cloud"
  homepage "https://robinmordasiewicz.github.io/xcsh"
  version "6.9.0"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "xcsh"

  on_macos do
    on_intel do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_darwin_amd64.tar.gz"
      sha256 "763090c9c9108a822f7475aad8334e9b8fb090aceadd3c2d299617fb8e9b6789"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_darwin_arm64.tar.gz"
      sha256 "02876e750064aea4ef14231c4edee85d6ae883b192d9f16cb5e93162572f8739"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_linux_amd64.tar.gz"
      sha256 "5dc013e3c1ed19b25bee076d13949f3329004eceb0fe5a1f722c26d8e20090d3"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_linux_arm64.tar.gz"
      sha256 "5e3e30ad10b3a0d937d52537956529d1e5064766be2d856a043afe7a89565f39"
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
