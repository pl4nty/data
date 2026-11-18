-- Threat: !InfrastructureShared
-- Name: 21d04e25e0ae
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(string.lower(l_0_0), ".sdb$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
