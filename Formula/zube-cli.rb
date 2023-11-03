class ZubeCli < Formula
  desc "A command line utility to interact with zube.io"
  homepage "https://www.platogo.com"
  url "https://github.com/platogo/zube-cli/archive/refs/tags/0.3.2.tar.gz"
  sha256 "3d6748f90199afe01ba75dbac3c2a8787bd237cd3a26f6fe1d52e77b404ca322"
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
