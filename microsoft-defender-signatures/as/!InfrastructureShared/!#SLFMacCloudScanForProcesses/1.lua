-- Threat: !InfrastructureShared
-- Name: !#SLF:MacCloudScanForProcesses
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (BM_MACHO64_FILE | BM_MACHO32_FILE | BM_PHP_FILE | BM_XAR_ARCHIVE_FILE | Lua:PYExt | Lua:PHPExt | Lua:SCPTExt)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if string.find(l_0_1, "/documents", 1, true) ~= nil or string.find(l_0_1, "/downloads", 1, true) ~= nil or string.find(l_0_1, "/tmp", 1, true) ~= nil then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    if string.find(l_0_2, "curl", 1, true) ~= nil or string.find(l_0_2, "wget", 1, true) ~= nil or string.find(l_0_2, "safari", 1, true) ~= nil or string.find(l_0_2, "unzip", 1, true) ~= nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
