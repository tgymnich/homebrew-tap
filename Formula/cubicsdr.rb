require "formula"

class Cubicsdr < Formula
  homepage "https://github.com/cjcliffe/CubicSDR"
  url "https://github.com/cjcliffe/CubicSDR/archive/0.2.5.tar.gz"
  sha256 "b058883a82c466530000ec15aa6c7f690036efb0374ca4da87da441fbd2043cf"
  head "https://github.com/cjcliffe/CubicSDR.git"

  patch :DATA

  depends_on "cmake" => :build

  depends_on "fftw" => "without-fortran"
  depends_on "librtlsdr"
  depends_on "liquid-dsp"
  depends_on "soapysdr"
  depends_on "soapyrtlsdr"
  depends_on "wxWidgets"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end


__END__
diff --git a/src/modules/modem/ModemDigital.cpp b/src/modules/modem/ModemDigital.cpp
index f1d4a820264ed7ad6c836848ac7712f6df6da3cf..4066c00c52245cab384515b492d0810084e48ed1 100644
--- a/src/modules/modem/ModemDigital.cpp
+++ b/src/modules/modem/ModemDigital.cpp
@@ -48,11 +48,11 @@ int ModemDigital::getDemodulatorLock() {
     return currentDemodLock.load();
 }
 
-void ModemDigital::updateDemodulatorLock(modemcf mod, float sensitivity) {
-    setDemodulatorLock(modemcf_get_demodulator_evm(mod) <= sensitivity);
+void ModemDigital::updateDemodulatorLock(modem mod, float sensitivity) {
+    setDemodulatorLock(modem_get_demodulator_evm(mod) <= sensitivity);
 }
 
-void ModemDigital::digitalStart(ModemKitDigital * /* kit */, modemcf /* mod */, ModemIQData *input) {
+void ModemDigital::digitalStart(ModemKitDigital * /* kit */, modem /* mod */, ModemIQData *input) {
     size_t bufSize = input->data.size();
     
     if (demodOutputDataDigital.size() != bufSize) {
@@ -63,7 +63,7 @@ void ModemDigital::digitalStart(ModemKitDigital * /* kit */, modemcf /* mod */,
     }
 }
 
-void ModemDigital::digitalFinish(ModemKitDigital * /* kit */, modemcf /* mod */) {
+void ModemDigital::digitalFinish(ModemKitDigital * /* kit */, modem /* mod */) {
 #if ENABLE_DIGITAL_LAB
     if (digitalOut && outStream.str().length()) {
         digitalOut->write(outStream.str());
diff --git a/src/modules/modem/ModemDigital.h b/src/modules/modem/ModemDigital.h
index ee341fcf7c6f28dede0d6ba0cdcdce9e9c173ab1..da756e31f55be5507fae3af06373bfcc38299bf3 100644
--- a/src/modules/modem/ModemDigital.h
+++ b/src/modules/modem/ModemDigital.h
@@ -42,13 +42,13 @@ public:
     ModemKit *buildKit(long long sampleRate, int audioSampleRate) override;
     void disposeKit(ModemKit *kit) override;
     
-    virtual void digitalStart(ModemKitDigital *kit, modemcf mod, ModemIQData *input);
-    virtual void digitalFinish(ModemKitDigital *kit, modemcf mod);
+    virtual void digitalStart(ModemKitDigital *kit, modem mod, ModemIQData *input);
+    virtual void digitalFinish(ModemKitDigital *kit, modem mod);
 
     virtual void setDemodulatorLock(bool demod_lock_in);
     virtual int getDemodulatorLock();
     
-    virtual void updateDemodulatorLock(modemcf mod, float sensitivity);
+    virtual void updateDemodulatorLock(modem mod, float sensitivity);
 
 #if ENABLE_DIGITAL_LAB
     void setOutput(ModemDigitalOutput *digitalOutput);
@@ -61,4 +61,4 @@ protected:
     ModemDigitalOutput *digitalOut;
     std::stringstream outStream;
 #endif
-};
\ No newline at end of file
+};
