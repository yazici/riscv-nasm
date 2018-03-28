find_package(Perl REQUIRED)

set (PERFHASH_FILE "${PROJECT_SOURCE_DIR}/nasmlib/perfhash.pl")

function (PERFHASH OPT IN OUT)

    if (NOT IS_ABSOLUTE "${IN}")
        set (IN "${CMAKE_CURRENT_SOURCE_DIR}/${IN}")
    endif (NOT IS_ABSOLUTE "${IN}")

    if (NOT IS_ABSOLUTE "${OUT}")
        set (OUT "${CMAKE_CURRENT_BINARY_DIR}/${OUT}")
    endif (NOT IS_ABSOLUTE "${OUT}")

    add_custom_command(OUTPUT "${OUT}"
        COMMAND "${PERL_EXECUTABLE}" -I "${PROJECT_SOURCE_DIR}/perllib" -I "${CMAKE_CURRENT_SOURCE_DIR}" "${PERFHASH_FILE}" ${OPT} "${IN}" "${OUT}"
        DEPENDS "${PROJECT_SOURCE_DIR}/perllib/phash.ph"
                "${IN}"
                "${PERFHASH_FILE}")

endfunction (PERFHASH OPT IN OUT)
