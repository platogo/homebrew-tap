class AtossCli < Formula
  desc 'Command line utility for interacting with ATOSS time sheets.'
  homepage 'https://www.platogo.com'
  url 'https://github.com/platogo/atoss-cli/archive/refs/tags/0.3.8-SNAPSHOT.tar.gz'
  sha256 'cfc9d1b8583ca211502b936789386f5f324b76cd0c9ce6c19b47ee1b48c02c20'
  version '0.3.8'
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
