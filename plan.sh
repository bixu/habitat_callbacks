pkg_name=service
pkg_origin=bixu
pkg_version=0.1.0
pkg_license=('Apache 2')
pkg_build_deps=(
  'core/curl'
)

eval "$(curl --silent https://raw.githubusercontent.com/bixu/habitat_callbacks/master/_promote_pkg?$current_date)"
eval "$(curl --silent https://raw.githubusercontent.com/bixu/habitat_callbacks/master/_record_pkg_metadata?$current_date)"
eval "$(curl --silent https://raw.githubusercontent.com/bixu/habitat_callbacks/master/do_after?$current_date)"

do_prepare() {
  _record_pkg_metadata
  return $?
}

do_after_success() {
  _promote_pkg 'staging'
  return $?
}
