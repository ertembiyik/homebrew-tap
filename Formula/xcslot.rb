class Xcslot < Formula
  desc "Warm Xcode build slots for parallel coding agents"
  homepage "https://github.com/ertembiyik/xcslot"
  version "0.1.5"
  license "MIT"

  # brew style allows no url inside on_arm and on_intel.
  if Hardware::CPU.arm?
    url "https://github.com/ertembiyik/xcslot/releases/download/v0.1.5/xcslot-darwin-arm64"
    sha256 "6c8758f47adc76e261b4586d8ff7c30c5f204cd66b4c7fa9b8a13e4029148db7"
  else
    url "https://github.com/ertembiyik/xcslot/releases/download/v0.1.5/xcslot-darwin-x64"
    sha256 "6ce83601e56a279ea309c4c4d21f4ae0c6908d98c37e49605a1f49205cd58870"
  end

  depends_on :macos

  def install
    bin.install Dir["xcslot-darwin-*"].first => "xcslot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xcslot --version")
  end
end
