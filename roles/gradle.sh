source roles/java.sh
kickstart.context "gradle"

baseline.gradle.install() {
  local gradle_basename='gradle-1.9'
  kickstart.package.install unzip

  (
  cd /opt
  kickstart.download.file "http://services.gradle.org/distributions/${gradle_basename}-bin.zip" "${gradle_basename}.zip"
  kickstart.mute "unzip -o ${gradle_basename}.zip"
  rm -rf gradle 2> /dev/null
  ln -s $gradle_basename gradle
  )
  kickstart.add_to_profile.d gradle.sh
}
baseline.gradle.install
