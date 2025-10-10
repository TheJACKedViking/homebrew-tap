class HappyCoder < Formula
  desc "Happy CLI tool for productive coding"
  homepage "https://github.com/slopus/happy-cli"

  # Choose ONE url/sha pair (I kept the newer one here)
  url "https://github.com/slopus/happy-cli/archive/refs/tags/v0.11.2-0.tar.gz"
  sha256 "c0e27ebe291f24a5a61c5939c8d7eefa555cf06a1d7a4cd8220513af52e74c28"

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
