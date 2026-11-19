-- Threat: !InfrastructureShared
-- Name: 382932c92603
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(string.lower(l_0_0), ".ini") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
