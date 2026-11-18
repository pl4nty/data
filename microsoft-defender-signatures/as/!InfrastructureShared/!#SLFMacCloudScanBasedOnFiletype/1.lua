-- Threat: !InfrastructureShared
-- Name: !#SLF:MacCloudScanBasedOnFiletype
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (BM_MACHO64_FILE | BM_MACHO32_FILE | Lua:PHPExt | Lua:SCPTExt)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 and l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if string.find(l_0_1, "/documents/", 1, true) ~= nil or string.find(l_0_1, "/downloads", 1, true) ~= nil or string.find(l_0_1, "/tmp/", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
