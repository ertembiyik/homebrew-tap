class Xcslot < Formula
  desc "Warm Xcode build slots for parallel coding agents"
  homepage "https://github.com/ertembiyik/xcslot"
  version "0.1.6"
  license "MIT"

  # brew style allows no url inside on_arm and on_intel.
  if Hardware::CPU.arm?
    url "https://github.com/ertembiyik/xcslot/releases/download/v0.1.6/xcslot-darwin-arm64"
    sha256 "dab01d229f56f4c871acfc33ab9e029b003da30d4c1b64a43c278b06eb6f62d5"
  else
    url "https://github.com/ertembiyik/xcslot/releases/download/v0.1.6/xcslot-darwin-x64"
    sha256 "95a4fc4cb972b6ffd7838e6852890070c2dba107ebf3cefdbd2fa5002d63ceff"
  end

  depends_on :macos

  def install
    bin.install Dir["xcslot-darwin-*"].first => "xcslot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xcslot --version")
  end
end
