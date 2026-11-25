class Xcslot < Formula
  desc "Warm Xcode build slots for parallel coding agents"
  homepage "https://github.com/ertembiyik/xcslot"
  version "0.1.4"
  license "MIT"

  # brew style allows no url inside on_arm and on_intel.
  if Hardware::CPU.arm?
    url "https://github.com/ertembiyik/xcslot/releases/download/v0.1.4/xcslot-darwin-arm64"
    sha256 "7d5d42bad3c16c04a72c0b4e4f01f9c0d153b01692482b3bc3a9b3c41c75e19a"
  else
    url "https://github.com/ertembiyik/xcslot/releases/download/v0.1.4/xcslot-darwin-x64"
    sha256 "859eccf22f3f4f6ac1139b77c07aee149854620f5519e5d6d71d3490536748df"
  end

  depends_on :macos

  def install
    bin.install Dir["xcslot-darwin-*"].first => "xcslot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xcslot --version")
  end
end
