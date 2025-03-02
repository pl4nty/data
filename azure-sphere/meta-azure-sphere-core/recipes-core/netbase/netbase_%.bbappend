do_install_append() {
    # Remove network files not required for Azure Sphere
    rm ${D}${sysconfdir}/protocols
    rm ${D}${sysconfdir}/services
}