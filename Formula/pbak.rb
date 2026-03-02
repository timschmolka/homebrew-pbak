class Pbak < Formula
  desc "Photo backup utility: SD card -> SSD -> Immich via immich-go"
  homepage "https://github.com/timschmolka/pbak"
  url "https://github.com/timschmolka/pbak/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "28b0c3a923173e956858699d74b36a089b740255698bf6c709c4a2b6745eccd3"
  license "MIT"

  depends_on "exiftool"
  depends_on "immich-go"
  depends_on "python@3"

  def install
    bin.install "bin/pbak"
    lib.install Dir["lib/pbak"]
    zsh_completion.install "completions/pbak.zsh" => "_pbak"
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
