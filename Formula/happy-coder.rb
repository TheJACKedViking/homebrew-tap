class HappyCoder < Formula
  desc "Happy CLI tool for productive coding"
  homepage "https://github.com/slopus/happy-cli"

  # Choose ONE url/sha pair (I kept the newer one here)
  url "https://registry.npmjs.org/happy-coder/-/happy-coder-0.10.0-2.tgz"
  sha256 "4756566cdae2d88d7f4fc7aeff6fb9e7acb83330b560bd33bcc5010617c142ea"

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
