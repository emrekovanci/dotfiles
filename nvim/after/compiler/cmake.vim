if exists("current_compiler")
    finish
endif
let current_compiler = "cmake"
CompilerSet makeprg=cmake\ --build\ build
