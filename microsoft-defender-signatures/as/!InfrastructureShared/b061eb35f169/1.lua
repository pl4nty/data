-- Threat: !InfrastructureShared
-- Name: b061eb35f169
-- Type: 21

if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "\\AppData\\Local\\Temp\\", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
