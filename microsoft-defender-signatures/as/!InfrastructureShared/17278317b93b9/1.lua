-- Threat: !InfrastructureShared
-- Name: 17278317b93b9
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 and string.find(string.lower(l_0_0), "microsoft.") then
  return mp.CLEAN
end
return mp.INFECTED
