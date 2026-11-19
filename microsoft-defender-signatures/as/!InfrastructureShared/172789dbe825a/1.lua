-- Threat: !InfrastructureShared
-- Name: 172789dbe825a
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 and string.find(string.lower(l_0_0), "microsoft.") then
  return mp.CLEAN
end
return mp.INFECTED
