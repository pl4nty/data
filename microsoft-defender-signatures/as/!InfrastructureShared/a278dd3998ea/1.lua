-- Threat: !InfrastructureShared
-- Name: a278dd3998ea
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if l_0_0 ~= nil and string.find(l_0_0, "\\w64time.dll", 1, true) == nil then
  return mp.INFECTED
end
return mp.CLEAN
