require 'formula'

class GrOsmosdr < Formula
  homepage 'http://sdr.osmocom.org/trac/wiki/GrOsmoSDR'
  url  'http://git.osmocom.org/gr-osmosdr', :using => :git, :tag => 'v0.1.1'
  head 'http://git.osmocom.org/gr-osmosdr', :using => :git

  depends_on 'cmake' => :build
  depends_on 'gnuradio'
  depends_on 'librtlsdr' => :recommended
  depends_on 'gr-iqbal' => :recommended

  def install
    mkdir 'build' do
      system 'cmake', '..', *std_cmake_args
      system 'make'
      system 'make install'
    end
  end

end
