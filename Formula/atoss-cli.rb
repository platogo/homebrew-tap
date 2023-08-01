class AtossCli < Formula
  desc 'Command line utility for interacting with ATOSS time sheets.'
  homepage 'https://www.platogo.com'
  url 'https://github.com/platogo/atoss-cli/archive/refs/tags/0.3.7-SNAPSHOT.tar.gz'
  sha256 'a70c93c4c2740430a3170a5f30b347ad7b98caf8628b09db2e7dce5a94f3286d'
  version '0.3.7'
  license 'EPL-2.0'
  head 'https://github.com/platogo/atoss-cli', branch: 'master'

  depends_on 'clojure' => :build
  depends_on 'leiningen' => :build
  depends_on 'openjdk@11'

  def install
    jar_name = 'atoss-cli-standalone.jar'
    system 'lein', 'uberjar'
    libexec.install "target/uberjar/#{jar_name}"
    bin.write_jar_script libexec / jar_name, 'atoss-cli', java_version: '11'
  end

  test do
    system 'atoss-cli' '--version'
  end
end
