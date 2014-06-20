require "formula"

class GrIqbal < Formula
  homepage 'https://lists.gnu.org/archive/html/discuss-gnuradio/2013-03/msg00245.html'
  url  'http://git.osmocom.org/gr-iqbal', :using => :git

  depends_on "cmake" => :build
  depends_on 'gnuradio'

  # patch to compile with deprecated `complex float` syntax
  # https://www.mail-archive.com/osmocom-sdr@lists.osmocom.org/msg00752.html
  patch :DATA

  def install
    mkdir 'build' do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

end

__END__
diff --git a/libosmo-dsp/include/osmocom/dsp/cxvec.h b/libosmo-dsp/include/osmocom/dsp/cxvec.h
index 063e30c..5adc771 100644
--- a/libosmo-dsp/include/osmocom/dsp/cxvec.h
+++ b/libosmo-dsp/include/osmocom/dsp/cxvec.h
@@ -33,7 +33,7 @@
  *  \brief Osmocom Complex vectors header
  */
 
-#include <complex.h>
+#include "/usr/include/complex.h"
 
 #define CXVEC_FLG_REAL_ONLY  (1<<0)  /*!< \brief Real values only */
 
diff --git a/libosmo-dsp/include/osmocom/dsp/iqbal.h b/libosmo-dsp/include/osmocom/dsp/iqbal.h
index c7f7e60..5b2b037 100644
--- a/libosmo-dsp/include/osmocom/dsp/iqbal.h
+++ b/libosmo-dsp/include/osmocom/dsp/iqbal.h
@@ -33,7 +33,7 @@
  *  \brief Osmocom IQ balance utils header
  */
 
-#include <complex.h>
+#include "/usr/include/complex.h"
 
 #include <osmocom/dsp/cxvec.h>
 
