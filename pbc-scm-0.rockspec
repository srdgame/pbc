package = "pbc"
version = "scm-0"

source = {
    url = "git://github.com/cloudwu/pbc.git",
}

description = {
    summary = "A protocol buffers library",
    detailed = "PBC is a google protocol buffers library for C without code generation.",
    homepage = "https://github.com/cloudwu/pbc",
    license = "MIT"
}

dependencies = {
    "lua >= 5.1, < 5.3"
}

build = {
    type = "builtin",
    modules = {
        protobuf = {
            sources = { 
                "src/alloc.c",
                "src/bootstrap.c",
                "src/decode.c",
                "src/pattern.c",
                "src/register.c",
                "src/stringpool.c",
                "src/wmessage.c",
                "src/array.c",
                "src/context.c",
                "src/map.c",
                "src/proto.c",
                "src/rmessage.c",
                "src/varint.c",
                "binding/lua/pbc-lua.c",
            },
            defines = {},
            incdirs = {"."},
        }
    },
    install = {
        lua = {
            ["protobuf"] = "binding/lua/protobuf.lua",
            ["protobuf.parser"] = "binding/lua/parser.lua",
        },
    },
    -- Override default build options (per platform)
    platforms = {
        win32 = { modules = { protobuf = { defines = {
            "FAKE_FAKE_WIN32",
        } } } }
    },
    copy_directories = { "test" }
}

-- vi:ai et sw=4 ts=4:
