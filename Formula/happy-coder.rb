class HappyCoder < Formula
  desc "Happy CLI tool for productive coding"
  homepage "https://github.com/slopus/happy-cli"

  # Choose ONE url/sha pair (I kept the newer one here)
  url "https://github.com/slopus/happy-cli/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "9d6245736f121763f8d2b0dc524f774f58d2a1f00254ebd7c0131beebdd16db1"

  license "MIT"

  depends_on "node" # no python unless you really need it

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/happy --version")
  end
end
