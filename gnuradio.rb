require 'formula'

class Gnuradio < Formula
  homepage 'http://gnuradio.org'
  url  'http://gnuradio.org/releases/gnuradio/gnuradio-3.7.3.tar.gz'
  sha1 'bf208448cbeca8ac1dabca9bbd6fa3f2185a9582'
  head 'https://gnuradio.org/git/gnuradio.git'

  option 'with-wx', 'build gr-wxgui'
  option 'with-qt', 'build gr-qtgui'
  option 'with-docs'
  option 'with-test'

  option 'without-gr-fec'
  option 'without-gr-trellis'
  option 'without-gr-noaa'
  option 'without-gr-atsc'
  option 'without-gr-pager'
  option 'without-gr-video-sdl'
  option 'without-gr-vocoder'
  option 'without-gr-wavelet'

  depends_on :x11

  # global
  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'cppunit' if build.with? 'test'
  depends_on 'fftw'
  depends_on 'orc' => :recommended

  # python wrappers
  depends_on :python
  depends_on 'swig'
  depends_on 'numpy' => :python

  # docs
  depends_on 'doxygen' if build.with? 'docs'

  # grc
  depends_on 'Cheetah' => :python
  depends_on 'pygtk'

  # gr-wavelet
  depends_on 'gsl' if build.with? 'gr-wavelet'

  # gr-qtgui
  depends_on 'pyqt' if build.with? 'qt'
  depends_on 'pyqwt' if build.with? 'qt'

  # gr-wxgui
  depends_on 'wxpython' if build.with? 'wx'
  depends_on 'lxml' => :python if build.with? 'wx'

  def install

    args = std_cmake_args

    # From opencv.rb
    python_prefix = %x(python-config --prefix).chomp
    args << "-DPYTHON_LIBRARY='#{python_prefix}/Python'"
    args << "-DPYTHON_INCLUDE_DIR='#{python_prefix}/Headers'"

    # gr modules
    args << '-DENABLE_GR_QTGUI='    + ((build.with? "qt"        ) ? "ON" : "OFF")
    args << '-DENABLE_GR_WXGUI='    + ((build.with? 'wx'        ) ? 'ON' : 'OFF')
    args << '-DENABLE_DOXYGEN='     + ((build.with? "docs"      ) ? "ON" : "OFF")
    args << '-DENABLE_TESTING='     + ((build.with? 'test'      ) ? 'ON' : 'OFF')
    args << '-DENABLE_GR_FEC='      + ((build.with? 'gr-fec'    ) ? 'ON' : 'OFF')
    args << '-DENABLE_GR_TRELLIS='  + ((build.with? 'gr-trellis') ? 'ON' : 'OFF')
    args << '-DENABLE_GR_NOAA='     + ((build.with? 'gr-noaa'   ) ? 'ON' : 'OFF')
    args << '-DENABLE_GR_ATSC='     + ((build.with? 'gr-atsc'   ) ? 'ON' : 'OFF')
    args << '-DENABLE_GR_PAGER='    + ((build.with? 'gr-pager'  ) ? 'ON' : 'OFF')
    args << '-DENABLE_GR_VIDEO='    + ((build.with? 'gr-video'  ) ? 'ON' : 'OFF')
    args << '-DENABLE_GR_VOCODER='  + ((build.with? 'gr-vocoder') ? 'ON' : 'OFF')
    args << '-DENABLE_GR_WAVELET='  + ((build.with? 'gr-wavelet') ? 'ON' : 'OFF')

    mkdir 'build' do
      system 'cmake', '..', *args
      system 'make'
      system 'make install'
    end

  end

  def caveats
    <<-EOS.undent
    If you want to use custom blocks, create this file:

    ~/.gnuradio/config.conf
      [grc]
      local_blocks_path=/usr/local/share/gnuradio/grc/blocks
    EOS
  end

end

__END__
diff --git a/gr-qtgui/lib/spectrumdisplayform.ui b/gr-qtgui/lib/spectrumdisplayform.ui
index 049d4ff..a40502b 100644
--- a/gr-qtgui/lib/spectrumdisplayform.ui
+++ b/gr-qtgui/lib/spectrumdisplayform.ui
@@ -518,7 +518,6 @@
   </layout>
  </widget>
  <layoutdefault spacing="6" margin="11"/>
- <pixmapfunction>qPixmapFromMimeSource</pixmapfunction>
  <customwidgets>
   <customwidget>
    <class>QwtWheel</class>
