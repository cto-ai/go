const { sdk } = require('@cto.ai/sdk')
const { spawn, exec } = require('child_process')
const parse = require('parse-github-url')

async function main() {
  var pkg = process.argv[process.argv.length-1]
  var get = await spawn('go', ['get', pkg])

  var url = parse(pkg);

  get.stdout.on('data', function (data) {
    sdk.log(data.toString())
  });

  get.stderr.on('data', function (data) {
   sdk.log(data.toString())
  });

  get.on('close', function (code) {
    exec(`${url.filepath}`, (err, stdout, sterr) => {
      sdk.log(stdout)
    })
  });
}

main()
