class Jx05presenter < Formula
  desc "Turns the JX-05 Bluetooth ring remote into a macOS presentation controller"
  homepage "https://github.com/savikko/jx05presenter"
  url "https://github.com/savikko/jx05presenter/releases/download/v1.3.0/ringbridge-v1.3.0-arm64.tar.gz"
  sha256 "651b8b793b982ef0698407cd493af2e2a5bee895a5a236bda3ea56c913cc9a9d"
  version "1.3.0"
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
