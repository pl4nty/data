-- Threat: !InfrastructureShared
-- Name: !#Lua:System32ZeroedPETimestamp
-- Type: 9
-- MpAttributes: !PEPCODE:HasDigitalSignature & !pea_ismsil & !pea_isdriver & !Lua:MUIExt & !pea_no_code & !BM_EFI_BOOT_SERVICE_DRIVER & !BM_EFI_RUNTIME_DRIVER & !BM_EFI_APPLICATION & !BM_EFI_ROM

if pehdr.TimeDateStamp == 0 then
  local l_0_0 = mp.getfilesize()
  if l_0_0 < 3000000 then
    local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
    l_0_1 = string.lower(MpCommon.PathToWin32Path(l_0_1))
    if l_0_1 ~= nil and l_0_1:find("c:\\windows\\system32\\", 1, true) then
      if l_0_1:find("\\driverstore\\filerepository\\", 1, true) then
        return mp.CLEAN
      end
      if l_0_1:find("\\spool\\drivers\\x64\\3\\", 1, true) then
        return mp.CLEAN
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
