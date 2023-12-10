# Now

- Readline-supported REPL
- Html parser
- Bundle tree shaking
- sys.sh/sys.execute allow capturing stderr via redirect to temporary file or
  similar

# Later

- help info and args table fixes
    - toku template -h shows "-l --load <load>" when it should be like "-l
      --load <module>"
    - consider parsed args should include arg.module instead of arg.load?
    - argparse doesn't seem to handle argument values that contain hyphens as
      their first character
        - Works: toku template -e CFLAGS " -a -b -c"
        - Fails: toku template -e CFLAGS "-a -b -c"

- toku bundle
    - allow dynamic or static linking of lualib
    - refactor
    - gzip luac?
    - tree shaking
    - parse lua syntax instead of pattern matching for require statements
    - test cases for emscripten, native static, and native dynamic

# Eventually

- toku trace interactive display for santoku.web.trace connections

- Generator interface
    - toku files / --span exec md5sum
    - toku pipe --each exec wget --jobs 10
