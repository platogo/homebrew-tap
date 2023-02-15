class Peactl < Formula
  desc "Access Platogo Erlang Architecture apps with a single command"
  homepage "https://www.platogo.com"
  head "https://github.com/platogo/peactl.git", branch: "master"
  version "9433de2"

  depends_on "go" => :build
  depends_on "dnsmasq"

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert true
  end
end
