-- Threat: !InfrastructureShared
-- Name: 2c29a1e6a29d
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "->%(Ole Stream %d%)$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
