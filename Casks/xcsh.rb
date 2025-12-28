cask "xcsh" do
  name "xcsh"
  desc "Command-line interface for F5 Distributed Cloud"
  homepage "https://robinmordasiewicz.github.io/xcsh"
  version "6.1.0"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "xcsh"

  on_macos do
    on_intel do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_darwin_amd64.tar.gz"
      sha256 "b1ac83b4c26d9e28685b05095c39aa01cedea5e17762ade12bcb9cf5c0b4cdb1"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_darwin_arm64.tar.gz"
      sha256 "e587d9c6856d52135fd184b6a2b2491c08a779e2359e15dffea82f677e81e884"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_linux_amd64.tar.gz"
      sha256 "7ee8e9ce48081e7cf901f664228e504e660e1f7f5b30ec80eb631e7ef9372276"
    end
    on_arm do
      url "https://github.com/robinmordasiewicz/xcsh/releases/download/v#{version}/xcsh_#{version}_linux_arm64.tar.gz"
      sha256 "64fbdaa1d5782005384da0f2d58324e569f3fddbc4dd9603725f10ecdad7f479"
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
