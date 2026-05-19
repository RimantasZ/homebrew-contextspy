class Contextspy < Formula
  desc "LLM proxy that analyses token usage in context windows"
  homepage "https://github.com/rimantas/contextspy"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rimantas/contextspy/releases/download/v#{version}/contextspy-macos-arm64.tar.gz"
      sha256 "REPLACE_ARM64_SHA256"
    end
    on_intel do
      url "https://github.com/rimantas/contextspy/releases/download/v#{version}/contextspy-macos-x86_64.tar.gz"
      sha256 "REPLACE_X86_64_SHA256"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rimantas/contextspy/releases/download/v#{version}/contextspy-linux-x86_64.tar.gz"
      sha256 "REPLACE_LINUX_SHA256"
    end
  end

  def install
    bin.install "contextspy"
  end

  test do
    assert_match "LLM context window", shell_output("#{bin}/contextspy --help")
  end
end