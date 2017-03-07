var semver = require('semver');
var program = require('commander');

program
    .version('0.0.1')
    .option('-n, --node [value]', 'Node.js version')
    .option('-s, --sailor [value]', 'Sailor version')
    .parse(process.argv);

var nodeJsVersion = program.node;
var sailorVersion = program.sailor;

var NPM_PACKAGE = 'https://www.npmjs.com/package/elasticio-sailor-nodejs';

if (!sailorVersion) {
    throw new Error('Please define a dependency to elasticio-sailor-nodejs.'
        + 'For more details see ' + NPM_PACKAGE);
}

if (semver.lt(sailorVersion, '1.3.0')) {
    throw new Error('You are using elasticio-sailor-nodejs@' + sailorVersion
        + ' which is not supported anymore.'
        + ' Please upgrade your version. For more details see ' + NPM_PACKAGE);
}

if (semver.gte(sailorVersion, '2.0.0')) {
    if (nodeJsVersion && semver.lt(nodeJsVersion, '6.0.0')) {

        throw new Error('You are using elasticio-sailor-nodejs@'
            + sailorVersion
            + ' which requires Node.js version >= 6.x but you defined engines.node='
            + nodeJsVersion
            + ' in package.json. Please use engines.node=6.10.0 or later 6.x release.');
    }
}