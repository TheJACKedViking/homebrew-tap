class HappyCoder < Formula
  desc "Happy CLI tool for productive coding"
  homepage "https://github.com/slopus/happy-cli"

  # Choose ONE url/sha pair (I kept the newer one here)
  url "https://registry.npmjs.org/happy-coder/-/happy-coder-0.10.1.tgz"
  sha256 "a38eebb738fc8746b26c3fb5896a0c5cd25616b7615a0ab3a67533a0bdb7d2db"

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
