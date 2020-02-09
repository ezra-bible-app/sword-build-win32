devenv bzip2\libbz2.dsp /Upgrade
msbuild bzip2\libbz2.vcxproj /p:Configuration=Release /p:PlatformToolset=v141 /p:TargetPlatformVersion=10.0.17763.0 /p:PreferredToolArchitecture=Win32