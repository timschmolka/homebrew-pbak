class Pbak < Formula
  desc "Photo backup utility: SD card -> SSD -> Immich via immich-go"
  homepage "https://github.com/timschmolka/pbak"
  url "https://github.com/timschmolka/pbak/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "040eb935a3f9e291047bf956807edadd8b5cc423406e8b40628c601e91248313"
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
