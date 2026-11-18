-- Threat: !InfrastructureShared
-- Name: !#SLF:XPlatBasFileAV
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
local l_0_2 = {
  "/usr/share/cymulate/av",
  "/usr/lib/cymulate/av",
  "/usr/local/share/cymulate/av",
  "/usr/local/lib/cymulate/av",
  "/users/shared/cymulate/av",
  "/applications/cymulate/av"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_4, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
