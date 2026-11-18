-- Threat: !InfrastructureShared
-- Name: !#SLF:MacCloudScanMachoFile
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (BM_MACHO64_FILE | BM_MACHO32_FILE)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 and l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if string.find(l_0_1, "/users/", 1, true) ~= nil and string.find(l_0_1, "/library", 1, true) == nil and string.find(l_0_1, ".app", 1, true) == nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
