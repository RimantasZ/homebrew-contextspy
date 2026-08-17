class Contextspy < Formula
  desc "LLM proxy that analyses token usage in context windows"
  homepage "https://github.com/RimantasZ/contextspy"
  version "0.3.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/RimantasZ/contextspy/releases/download/v#{version}/contextspy-macos-arm64.tar.gz"
      sha256 "70e199a7229c1082e7b62b956e8085737b0aacece36e533c1287d8b2ec93ebf2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/RimantasZ/contextspy/releases/download/v#{version}/contextspy-linux-x86_64.tar.gz"
      sha256 "c8db5c9e165da3d06411279e67a3771bd864884e6424e5057b17077d0dae47d7"
    end
  end

  def install
    bin.install "contextspy"
  end

  def caveats
    on_macos do
      <<~EOS
        The binary is not code-signed. If macOS Gatekeeper blocks it on first run:
          xattr -d com.apple.quarantine #{bin}/contextspy
      EOS
    end
  end

  test do
    assert_match "LLM context window", shell_output("#{bin}/contextspy --help")
  end
end