prepare_sailor() {
  echo "node ./node_modules/elasticio-sailor-nodejs/run.js" > sail.sh
  echo "node ./node_modules/elasticio-sailor-nodejs/runService.js \${1} \${2} \${3}" > serve.sh
}

update_component_json() {
  comp_file="component.json"
  sailor_ver=`read_json "$build_dir/node_modules/elasticio-sailor-nodejs/package.json" ".version"`
  ruby_command="require 'json';"
  ruby_command+="obj = JSON.parse(File.read('$comp_file'));"
  ruby_command+="obj['language'] = 'nodejs';"
  ruby_command+="obj['sailor_version'] = '$sailor_ver';"
  ruby_command+="File.open('$comp_file', 'w'){ |f| f <<  JSON.pretty_generate(obj)};"
  ruby -e "$ruby_command"
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

validate_compatibility() {
    sailor_ver=`read_json "$build_dir/node_modules/elasticio-sailor-nodejs/package.json" ".version"`
    info "Validating Sailor version $sailor_ver compatibility with Node.js version $node_engine"
    pushd "$bp_dir/compatibility" >/dev/null
    npm install
    info "Installed required dependencies"
    node $bp_dir/compatibility/validate.js $node_engine $sailor_ver 2>&1
    popd >/dev/null
}
