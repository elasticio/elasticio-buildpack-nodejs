var semver = require('semver');

var nodeJsVersion = process.argv[2];
var sailorVersion = process.argv[3];

if (!sailorVersion) {
    console.error(sailorVersionEndOfLifeMessage());
    throw new Error("");
}

if (semver.lt(sailorVersion, '1.3.0')) {
    console.error(sailorVersionEndOfLifeMessage());
    throw new Error("");
}

if (semver.gte(sailorVersion, '2.0.0')) {
    if (semver.lt(nodeJsVersion, '6.0.0')) {
        var msg = 'You are using elasticio-sailor-nodejs@'
            + sailorVersion
            + ' which requires Node.js version >= 6.x but you defined engines.node='
            + nodeJsVersion
            + ' in package.json';

        console.error(msg);

        throw new Error("");
    }
}

function sailorVersionEndOfLifeMessage() {
    var versionSuffix = sailorVersion ? '@' + sailorVersion : '';

    return 'You are using a version of elasticio-sailor-nodejs'
        + versionSuffix
        + ' which is not supported anymore.'
        + ' Please upgrade your version. For more details see https://www.npmjs.com/package/elasticio-sailor-nodejs'
}