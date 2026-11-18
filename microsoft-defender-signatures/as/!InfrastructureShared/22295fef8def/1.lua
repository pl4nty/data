-- Threat: !InfrastructureShared
-- Name: 22295fef8def
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(string.lower(l_0_0), ".xps") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
