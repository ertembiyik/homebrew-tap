class Xcslot < Formula
  desc "Warm Xcode build slots for parallel coding agents"
  homepage "https://github.com/ertembiyik/xcslot"
  version "0.1.8"
  license "MIT"

  # brew style allows no url inside on_arm and on_intel.
  if Hardware::CPU.arm?
    url "https://github.com/ertembiyik/xcslot/releases/download/v0.1.8/xcslot-darwin-arm64"
    sha256 "d820e10d7c29681fecc232ff9accb76b95c56a14d93609db24f2d626d7fba831"
  else
    url "https://github.com/ertembiyik/xcslot/releases/download/v0.1.8/xcslot-darwin-x64"
    sha256 "66dac4116af8c66bb9429be8fcf5257a5efb2eff1d1a35aaf4bcbe2c1e59895e"
  end

  depends_on :macos

  def install
    bin.install Dir["xcslot-darwin-*"].first => "xcslot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xcslot --version")
  end
end
