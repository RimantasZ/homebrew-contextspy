class Contextspy < Formula
  desc "LLM proxy that analyses token usage in context windows"
  homepage "https://github.com/RimantasZ/contextspy"
  version "0.1.3"
  license "Apache-2.0"

  # Pre-built binary — no compilation step, no bottles needed.
  bottle :unneeded

  on_macos do
    on_arm do
      url "https://github.com/RimantasZ/contextspy/releases/download/v#{version}/contextspy-macos-arm64.tar.gz"
      sha256 "c02351f7f80cfbaa43b943c01e1d524968f58f25b0b6dcab8d765a1485212204"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/RimantasZ/contextspy/releases/download/v#{version}/contextspy-linux-x86_64.tar.gz"
      sha256 "e352b59a8caeaea84155a3bf8fdab61e46445a3385e1322c7c630051f483fa7a"
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