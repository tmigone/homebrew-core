class Htmldoc < Formula
  desc "Convert HTML to PDF or PostScript"
  homepage "https://www.msweet.org/htmldoc/"
  url "https://github.com/michaelrsweet/htmldoc/archive/v1.9.10.tar.gz"
  sha256 "c987451a22b62ee97680bb84e9731055a99eea87e654d437725e7c263756d3c3"
  license "GPL-2.0-only"
  head "https://github.com/michaelrsweet/htmldoc.git"

  bottle do
    sha256 "f79c834310ae1d6b00c91f3ad8fe52a74e24c99c034f858df603e38be03f04d6" => :catalina
    sha256 "4a836bef89bfad7066df20527ed7b1ff59bc82738d13fdb6e5220bdb9e64b3c1" => :mojave
    sha256 "0e2d12668674dce9db320db8feb3468f897af6551f94ddf0e12231b8ecceb398" => :high_sierra
  end

  depends_on "jpeg"
  depends_on "libpng"

  def install
    system "./configure", "--disable-debug",
                          "--disable-ssl",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/htmldoc", "--version"
  end
end
