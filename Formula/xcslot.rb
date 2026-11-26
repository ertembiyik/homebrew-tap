class Xcslot < Formula
  desc "Warm Xcode build slots for parallel coding agents"
  homepage "https://github.com/ertembiyik/xcslot"
  version "0.1.7"
  license "MIT"

  # brew style allows no url inside on_arm and on_intel.
  if Hardware::CPU.arm?
    url "https://github.com/ertembiyik/xcslot/releases/download/v0.1.7/xcslot-darwin-arm64"
    sha256 "204724dbdb788012f14ad5ba1a8b8ee5e24af2bc8abf07dfafe3876646adc3af"
  else
    url "https://github.com/ertembiyik/xcslot/releases/download/v0.1.7/xcslot-darwin-x64"
    sha256 "659fccd1f99080c1a05a0e7a2b3fad7214aa24b2c9e61bba7607eaaf14cdba95"
  end

  depends_on :macos

  def install
    bin.install Dir["xcslot-darwin-*"].first => "xcslot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xcslot --version")
  end
end
