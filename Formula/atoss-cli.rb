class AtossCli < Formula
  desc "Command line utility for interacting with ATOSS time sheets."
  homepage "https://www.platogo.com"
  url "https://github.com/platogo/atoss-cli/archive/refs/tags/0.3.4-SNAPSHOT.tar.gz"
  sha256 "eab287dc033a69950d5dc51bf7e979d88a49226144b2a347c1102dca35a030c3"
  version "0.3.4"
  license "EPL-2.0"
  head "https://github.com/platogo/atoss-cli", branch: "master"

  depends_on "clojure" => :build
  depends_on "leiningen" => :build
  depends_on "openjdk@11"

  def install
    system "/usr/local/bin/brew", "install", "--cask", "chromedriver"
    jar_name = "atoss-cli-standalone.jar"
    system "lein", "uberjar"
    libexec.install "target/default+uberjar/#{jar_name}"
    bin.write_jar_script libexec/jar_name, "atoss-cli", java_version: "11"
  end

  test do
    system "atoss-cli" "--version"
  end
end
