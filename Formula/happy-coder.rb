class HappyCoder < Formula
  desc "Happy CLI tool for productive coding"
  homepage "https://github.com/slopus/happy-cli"

  # Choose ONE url/sha pair (I kept the newer one here)
  url "https://registry.npmjs.org/happy-coder/-/happy-coder-0.10.0.tgz"
  sha256 "5b3ca48766ae7190ef6705340305aa20901cba7a7b69ee0cc915f5a97bcf8cd5"

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
