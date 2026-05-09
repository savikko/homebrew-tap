class Jx05presenter < Formula
  desc "Turns the JX-05 Bluetooth ring remote into a macOS presentation controller"
  homepage "https://github.com/savikko/jx05presenter"
  url "https://github.com/savikko/jx05presenter/releases/download/v1.2.0/ringbridge-v1.2.0-arm64.tar.gz"
  sha256 "1d7b95b6d3afe2d3594a486dcdd9f1daffc74a6a3557b1e6dc4a2fa8d618a2c0"
  version "1.2.0"
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
