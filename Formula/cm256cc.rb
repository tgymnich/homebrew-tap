class Cm256cc < Formula
  desc "Fast GF(256) Cauchy MDS Block Erasure Codec in C++"
  homepage "https://github.com/f4exb/cm256cc"
  url "https://github.com/f4exb/cm256cc/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "5e6643b7fe7f2dcebf5f602451a77d82959732dbe83bda5029958f9cda6ddac8"
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
    # software. Run the test with `brew test cm256cc`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
