project "libdeflate"
    kind "StaticLib"
    language "C"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("obj/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/libdeflate.h",
        "lib/utils.c",

        -- Dont include GZIP
        "lib/deflate_decompress.c",
        "lib/deflate_compress.c",
        "lib/adler32.c",
        "lib/zlib_decompress.c",

        -- Only support x86
        "lib/x86/cpu_features.c",
    }

    includedirs
    {
        "lib/",
        "include/"
    }

    filter "configurations:Debug"
        symbols "on"

    filter "configurations:Release"
        optimize "on"
