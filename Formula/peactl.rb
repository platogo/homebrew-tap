class Peactl < Formula
  desc "Access Platogo Erlang Architecture apps with a single command"
  homepage "https://www.platogo.com"
  head "https://github.com/platogo/peactl.git", branch: "master"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "/usr/local/bin/brew", "install", "--cask", "1password/tap/1password-cli"
    system "/usr/local/bin/brew", "install", "--cask", "1password"
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert true
  end
end
