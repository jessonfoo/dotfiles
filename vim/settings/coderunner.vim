
    " Disable this plugin
    let g:loaded_coderunner = 0

    " Disable keymaps
    let g:vcr_no_mappings = 0

    let g:vcr_languages["py"] = g:vcr_languages["python"]


    let g:vcr_languages["go"] = {
        \ "cmd": "/goroot/bin/go",
        \ "flags": "run",
        \ "shebang": "package main",
        \ "ext": "go"
    \ }
    let g:vcr_languages["objc"] = {
        \ "compiler": "cpp.sh",
        \ "compiler_flags": "-fobjc-arc -framework Foundation",
        \ "cmd": "./$compiler",
        \ "ext": "m"
    \ }
