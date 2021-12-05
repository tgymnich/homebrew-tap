class Soapyremote < Formula
    desc "Multi-device support module for SoapySDR"
    homepage "https://github.com/pothosware/SoapyRemote"
    url "https://github.com/pothosware/SoapyRemote/archive/refs/tags/soapy-remote-0.5.2.tar.gz"
    license "BSL-1.0"
    head "https://github.com/pothosware/SoapyRemote", branch: "master"
  
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
                   shell_output("#{Formula["soapysdr"].bin}/SoapySDRUtil --check=remote")
    end
  end
  