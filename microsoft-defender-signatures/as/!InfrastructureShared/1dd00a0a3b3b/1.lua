-- Threat: !InfrastructureShared
-- Name: 1dd00a0a3b3b
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(string.lower(l_0_0), ".sdb$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
