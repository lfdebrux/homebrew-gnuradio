require "formula"

class GrFcdproplus < Formula
  homepage "https://github.com/dl1ksv/gr-fcdproplus"
  url "https://github.com/dl1ksv/gr-fcdproplus.git"

  depends_on "cmake" => :build

  def install

    mkdir 'build' do
      system "cmake", "..", *std_cmake_args
      system "make", "install" # if this fails, try separate make/make install steps
    end
  end

end
