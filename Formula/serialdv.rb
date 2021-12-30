class Serialdv < Formula
  desc "C++ Minimal interface to encode and decode audio with AMBE3000 based devices in packet mode over a serial link."
  homepage "https://github.com/f4exb/serialDV"
  url "https://github.com/f4exb/serialDV/archive/refs/tags/v1.1.4.tar.gz"
  sha256 "0764701ac7b52ab4e7db26d91b0c0d5206377574a8ce4d705c9ec99b8f85ef79"
  license "GPL-3.0"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test serialDV`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
