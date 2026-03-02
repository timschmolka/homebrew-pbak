class Pbak < Formula
  desc "Photo backup CLI for photographers: SD card -> SSD -> Immich"
  homepage "https://github.com/timschmolka/pbak"
  url "https://github.com/timschmolka/pbak/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "ca8456cc453d316f2dc4fe07531d2559bd0de7a90fd1954135fd6a8c59198dec"
  license "MIT"

  depends_on "exiftool"
  depends_on "immich-go"
  depends_on "python@3"

  def install
    bin.install "bin/pbak"
    lib.install Dir["lib/pbak"]
    zsh_completion.install "completions/pbak.zsh" => "_pbak"
    bash_completion.install "completions/pbak.bash" => "pbak"
  end

  test do
    assert_match "pbak #{version}", shell_output("#{bin}/pbak --version")
  end

  def caveats
    <<~EOS
      Run 'pbak setup' to configure your Immich server and storage paths.

      Configuration is stored at:
        ~/.config/pbak/config

      The 'albums' command requires a Lightroom Classic catalog (.lrcat).
      Set the catalog path via 'pbak setup' or PBAK_LRC_CATALOG env var.
    EOS
  end
end
