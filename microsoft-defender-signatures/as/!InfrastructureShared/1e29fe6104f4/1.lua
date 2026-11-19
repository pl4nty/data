-- Threat: !InfrastructureShared
-- Name: 1e29fe6104f4
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(string.lower(l_0_0), ".asar$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
