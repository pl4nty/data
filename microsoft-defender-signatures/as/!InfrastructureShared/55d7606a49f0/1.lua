-- Threat: !InfrastructureShared
-- Name: 55d7606a49f0
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if #l_0_1 <= 60 then
  return mp.CLEAN
end
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
end
if string.find(l_0_1, "-useragent", 1, true) and string.find(l_0_1, "invoke-webrequest", 1, true) and string.find(l_0_1, "out-null", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
