local env = {

  name = "santoku-cli",
  version = "0.0.176-1",
  variable_prefix = "TK_CLI",
  license = "MIT",
  public = true,

  dependencies = {
    "lua >= 5.1",
    "santoku >= 0.0.179-1",
    "santoku-fs >= 0.0.24-1",
    "santoku-template >= 0.0.18-1",
    "santoku-bundle >= 0.0.25-1",
    "santoku-system >= 0.0.19-1",
    "santoku-test-runner >= 0.0.20-1",
    "santoku-make >= 0.0.38-1",
    "argparse >= 0.7.1-1",
  },

  test = {
    dependencies = {
      "luacov >= 0.15.0-1",
    },
  }

}

env.homepage = "https://github.com/treadwelllane/lua-" .. env.name
env.tarball = env.name .. "-" .. env.version .. ".tar.gz"
env.download = env.homepage .. "/releases/download/" .. env.version .. "/" .. env.tarball

return {
  type = "lib",
  env = env,
  rules = {
    copy = {
      "test/spec/santoku/cli/template.lua"
    }
  },
}
