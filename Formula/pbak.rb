class Pbak < Formula
  desc "Photo backup CLI for photographers: SD card -> SSD -> Immich"
  homepage "https://github.com/timschmolka/pbak"
  url "https://github.com/timschmolka/pbak/archive/refs/tags/v1.6.3.tar.gz"
  sha256 "29723cc04197a43f9c7dacad1b958eeab47d57068a3dae4136cc90dfa6999db9"
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
