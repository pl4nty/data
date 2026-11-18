-- Threat: !InfrastructureShared
-- Name: !#ALF:LUA:LinuxContextualCommonPath
-- Type: 12
-- MpAttributes: BM_7Z_FILE | BM_BZIP2_FILE | BM_CAB_FILE | BM_DEBIAN_PKG_FILE | BM_ELF_FILE | BM_GZIP_FILE | BM_JAVA_CLASS_FILE | BM_OFFICE_FILE | BM_PDF_FILE | BM_VBE_FILE | BM_XAR_ARCHIVE_FILE | BM_XML_FILE | BM_ZLIB_FILE | Lua:JARExt | Lua:JSExt | Lua:PYExt | Lua:PS1Ext

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = {
    "/.config/systemd/user",
    "/dev/shm",
    "/etc/cron.",
    "/etc/crontab",
    "/etc/init.d",
    "/etc/rc.d/init.d",
    "/etc/rc.d/rc",
    "/etc/rc.local",
    "/etc/systemd/system",
    "/lib/systemd/system",
    "/tmp",
    "/usr/lib/systemd/system",
    "/var/lock",
    "/var/mail",
    "/var/spool/cron",
    "/var/spool/mail",
    "/var/tmp"
  }
  local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
  for l_0_3 = 1, #l_0_1 do
    local l_0_4 = l_0_1[l_0_3]
    local l_0_5 = l_0_4:len()
    if l_0_2:sub(0, l_0_5) == l_0_4 then
      return mp.LOWFI
    end
  end
end
return mp.CLEAN
