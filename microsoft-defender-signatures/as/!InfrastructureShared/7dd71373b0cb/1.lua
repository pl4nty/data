-- Threat: !InfrastructureShared
-- Name: 7dd71373b0cb
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
  if l_0_1:find("winsas64.bat", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
