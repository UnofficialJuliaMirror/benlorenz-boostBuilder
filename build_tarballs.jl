# Note that this script can accept some limited command-line arguments, run
# `julia build_tarballs.jl --help` to see a usage message.
using BinaryBuilder

name = "boost"
version = v"1.67.0"

# Collection of sources required to build boost
sources = [
    "https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.bz2" =>
    "2684c972994ee57fc5632e03bf044746f6eb45d4920c343937a465fd67a5adba",

]

# Bash recipe for building across all platforms
script = raw"""
cd $WORKSPACE/srcdir
cd boost_1_67_0/
./bootstrap.sh --prefix=$prefix --without-libraries=python
./b2 install

"""

# These are the platforms we will build for by default, unless further
# platforms are passed in on the command line
platforms = supported_platforms()

# The products that we will ensure are always built
products(prefix) = [
    LibraryProduct(prefix, "libboost_math_tr1f", :libboost_math_tr1f),
    LibraryProduct(prefix, "libboost_thread", :libboost_thread),
    LibraryProduct(prefix, "libboost_unit_test_framework", :libboost_unit_test_framework),
    LibraryProduct(prefix, "libboost_type_erasure", :libboost_type_erasure),
    LibraryProduct(prefix, "libboost_chrono", :libboost_chrono),
    LibraryProduct(prefix, "libboost_math_c99l", :libboost_math_c99l),
    LibraryProduct(prefix, "libboost_locale", :libboost_locale),
    LibraryProduct(prefix, "libboost_program_options", :libboost_program_options),
    LibraryProduct(prefix, "libboost_date_time", :libboost_date_time),
    LibraryProduct(prefix, "libboost_graph", :libboost_graph),
    LibraryProduct(prefix, "libboost_signals", :libboost_signals),
    LibraryProduct(prefix, "libboost_iostreams", :libboost_iostreams),
    LibraryProduct(prefix, "libboost_stacktrace_addr2line", :libboost_stacktrace_addr2line),
    LibraryProduct(prefix, "libboost_system", :libboost_system),
    LibraryProduct(prefix, "libboost_wave", :libboost_wave),
    LibraryProduct(prefix, "libboost_wserialization", :libboost_wserialization),
    LibraryProduct(prefix, "libboost_math_tr1l", :libboost_math_tr1l),
    LibraryProduct(prefix, "libboost_math_tr1", :libboost_math_tr1),
    LibraryProduct(prefix, "libboost_filesystem", :libboost_filesystem),
    LibraryProduct(prefix, "libboost_random", :libboost_random),
    LibraryProduct(prefix, "libboost_coroutine", :libboost_coroutine),
    LibraryProduct(prefix, "libboost_serialization", :libboost_serialization),
    LibraryProduct(prefix, "libboost_context", :libboost_context),
    LibraryProduct(prefix, "libboost_container", :libboost_container),
    LibraryProduct(prefix, "libboost_stacktrace_noop", :libboost_stacktrace_noop),
    LibraryProduct(prefix, "libboost_contract", :libboost_contract),
    LibraryProduct(prefix, "libboost_prg_exec_monitor", :libboost_prg_exec_monitor),
    LibraryProduct(prefix, "libboost_regex", :libboost_regex),
    LibraryProduct(prefix, "libboost_log_setup", :libboost_log_setup),
    LibraryProduct(prefix, "libboost_math_c99", :libboost_math_c99),
    LibraryProduct(prefix, "libboost_timer", :libboost_timer),
    LibraryProduct(prefix, "libboost_stacktrace_basic", :libboost_stacktrace_basic),
    LibraryProduct(prefix, "libboost_math_c99f", :libboost_math_c99f),
    LibraryProduct(prefix, "libboost_log", :libboost_log),
    LibraryProduct(prefix, "libboost_atomic", :libboost_atomic)
]

# Dependencies that must be installed before this package can be built
dependencies = [
    
]

# Build the tarballs, and possibly a `build.jl` as well.
build_tarballs(ARGS, name, version, sources, script, platforms, products, dependencies)

