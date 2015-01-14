wallah::num_dot () {
  tr -d -C 0123456789.
}

get_node_version_from_package_json() {
  if [[ ! -f "../package.json" ]]; then
    return
  fi
  echo $("${wallah_bin}/get_json_value" "../package.json" "engines.node") | num_dot 2>/dev/null
}

wallah::download() {
  local url="$1"
  local archive="$2"
  local cache_dir="${HOME}/.wallah/cache"
  local cached_archive="${cache_dir}/${archive}"
  if [[ ! -f "${cached_archive}" ]]; then
    mkdir -p "${cache_dir}"
    curl --silent --output "${cached_archive}" "${url}"
  fi
  echo "${cached_archive}"
}

wallah::parse_node_args() {
  for arg in $@; do
    if [[ "${arg}" =~ ^(x64|x86) ]]; then
      wallah_node_cpu="${arg}"
      continue;
    fi
    if [[ "${arg}" =~ ^(linux|darwin|sunos)$ ]]; then
      wallah_node_platform="${arg}"
      continue;
    fi
    # I am aware this semver regex is imperfect
    if [[ "${arg}" =~ ^v?([0-9]+\.){2}[0-9]+ ]]; then
      wallah_node_version=$(echo ${arg} | tr -d v)
      continue;
    fi

    # If the arg doesn't look like anything else, assume first one
    # is the wallah_node_root
    if [[ -z "${wallah_node_root}" ]]; then
      wallah_node_root="${arg}"
    fi
  done

  ##### Compute default values as necessary #####
  if [[ -z "${wallah_node_cpu}" ]]; then
    wallah_node_cpu=x64
    if [[ "$(uname -p)" = "i686" ]]; then
      wallah_node_cpu=x86
    fi
  fi

  if [[ -z "${wallah_node_root}" ]]; then
    wallah_node_root="${wallah_bin}/../../node"
  fi

  if [[ -z "${wallah_node_platform}" ]]; then
    wallah_node_platform="$(uname | tr A-Z a-z)"
  fi

  if [[ -z "${wallah_node_version}" ]]; then
    wallah_node_version="$(get_node_version_from_package_json)"
  fi
}
