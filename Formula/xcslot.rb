class Xcslot < Formula
  desc "Warm Xcode build slots for parallel coding agents"
  homepage "https://github.com/ertembiyik/xcslot"
  version "0.1.3"
  license "MIT"

  # brew style allows no url inside on_arm and on_intel.
  if Hardware::CPU.arm?
    url "https://github.com/ertembiyik/xcslot/releases/download/v0.1.3/xcslot-darwin-arm64"
    sha256 "bdf2939296c7d127a334f3003f5fda16fd46ceec297bcaf6c89e64e0da24b5ef"
  else
    url "https://github.com/ertembiyik/xcslot/releases/download/v0.1.3/xcslot-darwin-x64"
    sha256 "05aacbe5579e7b7a8e956c1bd702371f586d0977988b9d3e4a0e5465e8f455ce"
  end

  depends_on :macos

  def install
    bin.install Dir["xcslot-darwin-*"].first => "xcslot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xcslot --version")
  end
end
