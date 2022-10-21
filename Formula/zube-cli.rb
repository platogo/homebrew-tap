class ZubeCli < Formula
  desc "A command line utility to interact with zube.io"
  homepage "https://www.platogo.com"
  url "https://github.com/platogo/zube-cli/archive/refs/tags/0.3.0.tar.gz"
  sha256 "09af2574efbdce951862e24eeb4aaed995348281fca4a075fd2f40948d2c04fc"
  license "GPL-3.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w")
    bin.install_symlink bin/"zube-cli" => "zube"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test zube-cli`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    assert_predicate bin/"zube-cli", :exist?
  end
end
