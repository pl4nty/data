-- Threat: \xac!FakeUpdate.SS
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: (AGGR:MSIX.Download.S1 | AGGR:MSIX.Download.S2)

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil or l_0_0 == "" then
  if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) ~= true then
    return mp.CLEAN
  end
  if mp.GetMOTWZone() < 3 then
    return mp.CLEAN
  end
  l_0_0 = mp.GetMOTWHostUrl()
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if StringEndsWith(l_0_0, ".php") then
  return mp.INFECTED
end
return mp.CLEAN
