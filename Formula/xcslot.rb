class Xcslot < Formula
  desc "Warm Xcode build slots for parallel coding agents"
  homepage "https://github.com/ertembiyik/xcslot"
  version "0.1.2"
  license "MIT"

  # brew style allows no url inside on_arm and on_intel.
  if Hardware::CPU.arm?
    url "https://github.com/ertembiyik/xcslot/releases/download/v0.1.2/xcslot-darwin-arm64"
    sha256 "77f40fb92fa2668c4fa0e2b22109c2f4016f1369de8a2db374f8becc26697842"
  else
    url "https://github.com/ertembiyik/xcslot/releases/download/v0.1.2/xcslot-darwin-x64"
    sha256 "7fe399d696bdadc32980fa306fa1eff9e7d2d99b65199d96ffbfcacd6493beb0"
  end

  depends_on :macos

  def install
    bin.install Dir["xcslot-darwin-*"].first => "xcslot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xcslot --version")
  end
end
