class ZubeCli < Formula
  desc "A command line utility to interact with zube.io"
  homepage "https://www.platogo.com"
  url "https://github.com/platogo/zube-cli/archive/refs/tags/0.3.3.tar.gz"
  sha256 "25a312d6faf398c75b5b7fae6713f34b59d75ff4ae6ae278dad13dc44ea4a006"
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
