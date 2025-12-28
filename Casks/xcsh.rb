cask "xcsh" do
  name "xcsh"
  desc "Command-line interface for F5 Distributed Cloud"
  homepage "https://robinmordasiewicz.github.io/xcsh"
  version "6.2.0"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "xcsh"

  on_macos do
    on_intel do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_darwin_amd64.tar.gz"
      sha256 "e3eb73b87effd244f77884f9748a85817868b17e09ff2cc237a648d6e17438ba"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_darwin_arm64.tar.gz"
      sha256 "b93ef3fc801c733af3dc07e647a904f76da439f7a34307af84996c013a0ae438"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_linux_amd64.tar.gz"
      sha256 "c2ee902631b5ec10af3f2e5c1ab5a9d662666a84cda5f7dbce57b9f37c8baef8"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_linux_arm64.tar.gz"
      sha256 "231029704fbbea61f0a48eda0c7efebec5fbae940c25bd0991b892b9f0b3b99a"
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
