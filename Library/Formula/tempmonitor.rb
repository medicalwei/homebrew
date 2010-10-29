require 'formula'

class Tempmonitor <Formula
   url 'http://www.bresink.com/osx/0TemperatureMonitor/download.php5/TemperatureMonitor.dmg', \
      :using => NoUnzipCurlDownloadStrategy
   # Note: Download does not really work, you must manually download
   # and copy it to your ~/Library/Caches/Homebrew folder with the
   # appropriate name: tempmonitor-<version>.dmg
   version "4.94"
   homepage 'http://www.bresink.com/osx/0TemperatureMonitor/details.html'
   md5 '1fe6729acb37a851bfb60914a5138827'

   # don't strip binaries
   skip_clean ['bin']

   def install
      system "hdiutil attach TemperatureMonitor.dmg"
      bin.mkdir
      cp "/Volumes/Temperature Monitor #{version}/TemperatureMonitor.app/Contents/MacOS/tempmonitor", (bin+'tempmonitor')
      chmod 0555, (bin+'tempmonitor')
      system "hdiutil detach \"/Volumes/Temperature Monitor #{version}\""
   end
end
