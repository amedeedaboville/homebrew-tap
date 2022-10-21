class Zoxy < Formula
  desc "Proxy local requests like localhost:8888 to jupyter.z"
  homepage "https://gitlab.com/amedeedabo/zoxy"
  url "https://gitlab.com/amedeedabo/zoxy/-/archive/v0.5.0/zoxy-v0.5.0.tar.gz"
  sha256 "21c33decdfe10555f518b79e3dcb0f4b21c6d11b719550b64aa75effe88913b1"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  service do
    error_log_path var/"log/zoxy.log"
    log_path var/"log/zoxy.log"

    # TODO: don't keep alive if user config is broken
    run bin/"zoxy"
    keep_alive true
  end

  test do
    system bin/"zoxy" "config path"
    # TODO: run with bad config and expect it to stop itself
    # system bin/"zoxy" "--config=<(bad_config)"
    # or add --noDNS and --proxyPort options to be able to
    # start it without sudo

    true
  end
end
