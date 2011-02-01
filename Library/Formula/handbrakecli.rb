require 'formula'

class Handbrakecli <Formula
   # @@dmgversion = 'svn3606'
   @@dmgversion = '0.9.5'
   @@arch = 'x86_64'
   @@dmgname = "HandBrake-#{@@dmgversion}-MacOSX.5_CLI_#{@@arch}"
   if /svn/.match(@@dmgversion)
      @@dmgurl = 'https://build.handbrake.fr/job/Mac/lastSuccessfulBuild/artifact/trunk/packages/'+@@dmgname+'.dmg'
   else
      @@dmgurl = 'http://handbrake.fr/rotation.php?file='+@@dmgname+'.dmg'
   end

   homepage 'http://handbrake.fr/'
   url @@dmgurl, :using => NoUnzipCurlDownloadStrategy
   version "#{/svn/.match(@@dmgversion) ? @@dmgversion.sub(/svn/,'') : @@dmgversion}"
   # md5 '52b29610b0a6a322ca7caffc25844e2b'
   md5 'ebb61a2eb123e49c1f6cf25f81b82a0b'

   # don't strip binaries
   skip_clean ['bin']

   def install
      system "hdiutil attach #{File.basename(@@dmgurl)}"
      bin.mkdir
      cp "/Volumes/#{@@dmgname}/HandBrakeCLI", (bin+'HandBrakeCLI')
      chmod 0555, (bin+'HandBrakeCLI')
      system "hdiutil detach /Volumes/#{@@dmgname}"
   end
end
