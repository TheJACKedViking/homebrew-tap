class HappyCoder < Formula
  desc "Happy CLI tool for productive coding"
  homepage "https://github.com/slopus/happy-cli"

  # Choose ONE url/sha pair (I kept the newer one here)
  url "https://github.com/TheJACKedViking/happy-cli/archive/refs/tags/0.11.tar.gz"
  sha256 "d5ee18da369601908ab9e895835d74b9ee23dc6b4719e76354ec6b3fbe7b7b3c"

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
