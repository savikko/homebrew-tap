class Jx05presenter < Formula
  desc "Turns the JX-05 Bluetooth ring remote into a macOS presentation controller"
  homepage "https://github.com/savikko/jx05presenter"
  url "https://github.com/savikko/jx05presenter/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "5ba03ad27d1a49428ad4c4117e015450a3022264e11ad7f1294e1af1099d7058"
  license "MIT"

  depends_on :macos

  service do
    run [opt_bin/"ringbridge"]
    keep_alive true
    log_path var/"log/ringbridge.log"
    error_log_path var/"log/ringbridge.log"
  end

  def install
    system "swiftc", "ringbridge.swift", "-o", "ringbridge"
    bin.install "ringbridge"
  end

  test do
    assert_match "JX-05", shell_output("#{bin}/ringbridge 2>&1", 1)
  end
end
