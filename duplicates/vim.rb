require 'formula'

class Vim < Formula
  # Get stable versions from hg repo instead of downloading an increasing
  # number of separate patches.
  url 'https://vim.googlecode.com/hg/', :revision => '25be7c9dda54'
  version '7.3.266'
  homepage 'http://www.vim.org/'

  head 'https://vim.googlecode.com/hg/'

  def install
    system "./configure", "--disable-darwin",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--enable-gui=no",
                          "--without-x",
                          "--disable-nls",
                          "--enable-multibyte",
                          "--with-tlib=ncurses",
                          "--enable-pythoninterp",
                          "--with-python-config-dir=/usr/local/lib/python2.7/config",
                          "--enable-rubyinterp",
                          "--with-features=huge"
    system "make"
    system "make install"
  end
end
