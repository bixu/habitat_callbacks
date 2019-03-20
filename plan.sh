pkg_name=service
pkg_origin=bixu
pkg_version=0.1.0
pkg_license=('Apache 2')
pkg_build_deps=(
  'core/git'
)

do_before() {
  rm -rf habitat_callbacks
  git clone 'https://github.com/bixu/habitat_callbacks.git'
  for file in ./habitat_callbacks/linux/*
  do
    source $file
  done
}

do_build() {
  return 0
}

do_install() {
  return 0
}

do_prepare() {
  _record_pkg_metadata
  return $?
}

do_after_success() {
  _promote_pkg 'staging'
  return $?
}
