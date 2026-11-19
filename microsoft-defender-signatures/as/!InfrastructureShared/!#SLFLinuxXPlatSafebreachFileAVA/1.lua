-- Threat: !InfrastructureShared
-- Name: !#SLF:Linux/XPlatSafebreachFileAV.A
-- Type: 12
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_0 ~= mp.SCANREASON_UNKNOWN then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 < 20 then
  return mp.CLEAN
end
if string.find(l_0_1, "/tmp/sb-sim-temp-", 1, true) then
  local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
  if l_0_2 == nil or #l_0_2 < 4 then
    return mp.CLEAN
  end
  if string.find(l_0_2, "safebreach", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
