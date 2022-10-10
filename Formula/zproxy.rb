class Zproxy < Formula
  desc "Proxy local requests like localhost:8888 to jupyter.z"
  homepage "https://gitlab.com/amedeedabo/zproxy"
  url "https://gitlab.com/amedeedabo/zproxy/-/archive/v0.1.0/zproxy-v0.1.0.tar.gz"
  sha256 "486601263aa3c8d2ee7760617e0cd03a36f8b081971c745a00618aab2774fafc"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    # TODO: run with bad config and expect it to stop itself
    # system bin/"zproxy" "--config=<(bad_config)"
    # or add --noDNS and --proxyPort options to be able to
    # start it without sudo
    true
  end
end
