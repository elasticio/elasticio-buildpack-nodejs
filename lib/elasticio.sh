install_sailor() {
  npm install git+https://github.com/elasticio/sailor-nodejs.git#master
  echo "node ./node_modules/sailor-nodejs/run.js" > sail.sh
  echo "node ./node_modules/sailor-nodejs/runService.js \${1} \${2} \${3}" > serve.sh
}

write_language_file() {
  sailor_ver=`read_json "$build_dir/node_modules/sailor-nodejs/package.json" ".version"`
  ruby_command="require 'json';"
  ruby_command+="obj = {'language' => 'nodejs', 'sailor_version' => '$sailor_ver'};"
  ruby_command+="puts JSON.pretty_generate(obj);"
  ruby -e "$ruby_command" > elasticio_build.json
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
