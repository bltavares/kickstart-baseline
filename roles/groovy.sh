source roles/java.sh
kickstart.context "groovy"

groovy_basename='groovy-2.2.1'
groovy_tarball="${groovy_basename}.zip"

kickstart.package.install unzip

(
cd /opt
[ -f $groovy_tarball ] || kickstart.download.file http://dist.groovy.codehaus.org/distributions/groovy-binary-2.2.1.zip $groovy_tarball
kickstart.mute "unzip -o $groovy_tarball"
rm -rf groovy 2> /dev/null
ln -s $groovy_basename groovy
)
kickstart.path.add_to_profile.d groovy.sh
