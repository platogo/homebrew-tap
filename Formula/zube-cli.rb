class ZubeCli < Formula
  desc "A command line utility to interact with zube.io"
  homepage "https://www.platogo.com"
  url "https://github.com/platogo/zube-cli/archive/refs/tags/0.3.0.tar.gz"
  sha256 "09af2574efbdce951862e24eeb4aaed995348281fca4a075fd2f40948d2c04fc"
  license "GPL-3.0"
  head "https://github.com/platogo/zube-cli", branch: "master"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w")
    bin.install_symlink bin/"zube-cli" => "zube"
  end

  test do
    assert_predicate bin/"zube-cli", :exist?
  end
end
