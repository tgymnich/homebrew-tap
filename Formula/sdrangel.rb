class Sdrangel < Formula
  desc "SDR Rx/Tx software for Airspy, Airspy HF+, BladeRF, HackRF, LimeSDR, PlutoSDR, RTL-SDR, SDRplay RSP1 and FunCube"
  homepage "https://www.sdrangel.org"
  url "https://github.com/f4exb/sdrangel/archive/refs/tags/v6.17.6.tar.gz"
  sha256 "8827d17ad7f3a29562de7ce26006b781aa030c978cc431fd641f3b6a86f899fd"
  head "https://github.com/f4exb/sdrangel.git"
  license "GPL-3.0"

  depends_on "cmake" => :build

  depends_on "airspy"
  depends_on "airspyhf"
  depends_on "codec2"
  depends_on "opus"
  depends_on "libiconv"
  depends_on "opencv@3"
  depends_on "qt@5"
  depends_on "librtlsdr"
  depends_on "boost"
  depends_on "ffmpeg"
  depends_on "libusb"
  depends_on "soapysdr"
  depends_on "fftw" => "without-fortran"
  depends_on "cm256cc"
  depends_on "serialdv"

  # missing 
  # depends_on "limesuite"

  def serialdv
    deps.map(&:to_formula).find { |f| f.name.match? "^serialdv" }
  end

  def install
    args = std_cmake_args + %w[
      -DBUILD_GUI=ON
      -DBUILD_SERVER=OFF
      -DBUNDLE=OFF
      -DENABLE_AIRSPY=ON
      -DENABLE_AIRSPYHF=ON
      -DENABLE_BLADERF=OFF
      -DENABLE_FUNCUBE=OFF
      -DENABLE_HACKRF=OFF
      -DENABLE_IIO=OFF
      -DENABLE_LIMESUITE=OFF
      -DENABLE_MIRISDR=OFF
      -DENABLE_PERSEUS=OFF
      -DENABLE_RTLSDR=ON
      -DENABLE_SOAPYSDR=ON
      -DENABLE_SDRPLAY=OFF
      -DENABLE_XTRX=OFF
      -DFORCE_SSE41=ON
      -DRX_SAMPLE_24BIT=ON
    ]

    mkdir "build" do
      system "cmake", "..", *args, "-DSERIALDV_DIR=#{serialdv.opt_prefix}"
      system "cmake", "--build", "."
      system "cmake", "--build", ".", "--target", "install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test sdrangel`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
