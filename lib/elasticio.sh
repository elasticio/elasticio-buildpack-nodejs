install_sailor() {
  npm install git+https://github.com/elasticio/sailor-nodejs.git#master
}

run_tests() {
  if [[ $(read_json "$build_dir/package.json" ".scripts.test") != "" ]]; then
    npm test
  else
    warning "No tests specified. Please do it ASAP!"
  fi
}

remove_dev_dependences() {
  npm prune --production
}