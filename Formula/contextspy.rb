class Contextspy < Formula
  desc "LLM proxy that analyses token usage in context windows"
  homepage "https://github.com/RimantasZ/contextspy"
  version "0.1.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/RimantasZ/contextspy/releases/download/v#{version}/contextspy-macos-arm64.tar.gz"
      sha256 "4d92c2256af04d08143a9ba2ee9c29df80624264ef67d4b9b7bab7a0feb2d0a9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/RimantasZ/contextspy/releases/download/v#{version}/contextspy-linux-x86_64.tar.gz"
      sha256 "e76047d7d0ed5a2767423d6fab1ed26cdc70eeefe6600c890c3de97dd31aec98"
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