class Soapymultisdr < Formula
    desc "Multi-device support module for SoapySDR"
    homepage "https://github.com/pothosware/SoapyMultiSDR/wiki"
    url "https://github.com/pothosware/SoapyMultiSDR/archive/8cdde5679dced64be99f245038a95fb06a8ea23b.zip"
    version "0.0.0"
    license "BSL-1.0"
    head "https://github.com/pothosware/SoapyMultiSDR", branch: "master"
  
    depends_on "cmake" => :build
    depends_on "soapysdr"
  
    def install
      mkdir "build" do
        system "cmake", "..", "-DCMAKE_CXX_STANDARD=11", *std_cmake_args
        system "make", "install"
      end
    end
  
    test do
      assert_match "Checking driver 'multisdr'... PRESENT",
                   shell_output("#{Formula["soapysdr"].bin}/SoapySDRUtil --check=multisdr")
    end
  end
  