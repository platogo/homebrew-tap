class Peactl < Formula
  desc "Access Platogo Erlang Architecture apps with a single command"
  homepage "https://www.platogo.com"
  head "https://github.com/platogo/peactl.git", branch: "master"
  version "0.1.6"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w")

    output = Utils.safe_popen_read("#{bin}/peactl", "completion", "zsh")
    (zsh_completion/"_peactl").write output

    output = Utils.safe_popen_read("#{bin}/peactl", "completion", "bash")
    (bash_completion/"peactl").write output

    output = Utils.safe_popen_read("#{bin}/peactl", "completion", "fish")
    (fish_completion/"peactl").write output
  end

  test do
    assert true
  end
end
