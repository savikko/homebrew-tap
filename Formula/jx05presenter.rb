class Jx05presenter < Formula
  desc "Turns the JX-05 Bluetooth ring remote into a macOS presentation controller"
  homepage "https://github.com/savikko/jx05presenter"
  url "https://github.com/savikko/jx05presenter/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "36849c26aee574718662cba99eddc375965cd39f674776db90c87c67e78fac4d"
  license "MIT"

  depends_on :macos
  depends_on :xcode => ["14.0", :build]

  def install
    system "swiftc", "ringbridge.swift", "-o", "ringbridge"
    bin.install "ringbridge"
  end

  test do
    assert_match "JX-05", shell_output("#{bin}/ringbridge 2>&1", 1)
  end
end
