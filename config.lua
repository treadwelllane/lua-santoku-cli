local env = {

  name = "santoku-cli",
  version = "0.0.117-1",
  variable_prefix = "TK_CLI",
  license = "MIT",
  public = true,

  dependencies = {
    "lua >= 5.1",
    "santoku >= 0.0.146-1",
    "santoku-fs >= 0.0.2-1",
    "santoku-template >= 0.0.2-1",
    "santoku-bundle >= 0.0.3-1",
    "santoku-system >= 0.0.2-1",
    "santoku-test >= 0.0.2-1",
    "argparse >= 0.7.1-1",
  },

  test_dependencies = {
    "luacov >= 0.15.0-1",
    "luacheck >= 1.1.0-1",
    "luassert >= 1.9.0-1",
  },

}

env.homepage = "https://github.com/treadwelllane/lua-" .. env.name
env.tarball = env.name .. "-" .. env.version .. ".tar.gz"
env.download = env.homepage .. "/releases/download/" .. env.version .. "/" .. env.tarball

return {
  env = env,
  excludes = {
    "test/spec/santoku/cli/template.lua"
  },
}
