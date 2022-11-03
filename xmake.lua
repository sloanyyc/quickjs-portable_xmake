add_includedirs('porting')
add_defines('EMSCRIPTEN')
set_symbols("debug")

target('qkjswinsupport')
    set_kind('static')

    add_includedirs('porting')
    add_files('porting/*.c|polyfill.c')


target('quickjs')
    set_kind('static')

    add_files(
        'quickjs.c', 
        'libbf.c',
        'libregexp.c', 
        'libunicode.c',
        'cutils.c',
        'quickjs-libc.c'
    )

target('qjsc')
    set_kind('binary')

    add_deps('qkjswinsupport', 'quickjs')
    add_files('qjsc.c') -- 'qjs.c', 

target('qjs')
    set_kind('binary')

    add_deps('qkjswinsupport', 'quickjs')
    add_files('qjs.c', 'repl.c')
