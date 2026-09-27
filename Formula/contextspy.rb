class Contextspy < Formula
  desc "LLM proxy that analyses token usage in context windows"
  homepage "https://github.com/RimantasZ/contextspy"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/RimantasZ/contextspy/releases/download/v#{version}/contextspy-macos-arm64.tar.gz"
      sha256 "9ec503228ffd8fa06723fa52aa39dc7e9b1af5d5a0b11c8e26071b3beb3f5152"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/RimantasZ/contextspy/releases/download/v#{version}/contextspy-linux-x86_64.tar.gz"
      sha256 "b5326541dd839747117328354b528537d5edb3b73a5c5fa25b2e70db44f27209"
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