class Jx05presenter < Formula
  desc "Turns the JX-05 Bluetooth ring remote into a macOS presentation controller"
  homepage "https://github.com/savikko/jx05presenter"
  url "https://github.com/savikko/jx05presenter/releases/download/v1.6.0/ringbridge-v1.6.0-arm64.tar.gz"
  sha256 "e2faaa0ac4fb5d0fab7b9fd31801e2f02f98a932440efa69d11e2dca8ad69fdb"
  version "1.6.0"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  service do
    run [opt_bin/"ringbridge"]
    keep_alive true
    log_path var/"log/ringbridge.log"
    error_log_path var/"log/ringbridge.log"
  end

  def install
    bin.install "ringbridge"
  end

  test do
    assert_match "JX-05", shell_output("#{bin}/ringbridge 2>&1", 1)
  end
end
