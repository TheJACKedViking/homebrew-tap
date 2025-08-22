class HappyCoder < Formula
  desc "Happy CLI tool for productive coding"
  homepage "https://github.com/slopus/happy-cli"
  url "https://registry.npmjs.org/happy-coder/-/happy-coder-0.7.2.tgz"
  sha256 "070da15d4375ce49d39370ab8924568c8a62894e27013078035754a8dc575986"
  license "MIT"

  depends_on "node"
  depends_on "python" => :build

  def install
    # TODO: The @anthropic-ai/claude-code dependency includes a pre-compiled ripgrep.node binary
    # that wasn't built with sufficient header padding (-headerpad_max_install_names).
    # Homebrew's automatic dylib path relinking fails because the Mach-O header can't
    # accommodate the longer /opt/homebrew paths. Since this is a pre-compiled binary
    # we can't rebuild it, and the tool works fine with its original paths, so we
    # want to either Homebrew's linkage checking to avoid the installation
    # failure or some other way to prevent showing a scary error message that
    # does not impact happy-coder's functionality.
    #
    # For now, we'll just skip Homebrew's linkage checking.
    ENV["HOMEBREW_SKIP_LINKAGE_CHECKING"] = "1"

    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/happy", "--version"
  end
end
