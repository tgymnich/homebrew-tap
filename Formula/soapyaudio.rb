class Soapyaudio < Formula
    desc "Soapy SDR plugin for Audio devices"
    homepage "https://github.com/pothosware/SoapyAudio/wiki"
    license "MIT"
    head "https://github.com/pothosware/SoapyAudio", branch: "master"
  
    depends_on "cmake" => :build
    depends_on "soapysdr"
  
    def install
      mkdir "build" do
        system "cmake", "..", *std_cmake_args
        system "make", "install"
      end
    end
  
    test do
      assert_match "Checking driver 'rtlsdr'... PRESENT",
                   shell_output("#{Formula["soapysdr"].bin}/SoapySDRUtil --check=rtlsdr")
    end
  end
  