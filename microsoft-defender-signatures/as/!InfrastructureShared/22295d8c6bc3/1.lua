-- Threat: !InfrastructureShared
-- Name: 22295d8c6bc3
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "->%(Ole Stream %d%)$") ~= nil and mp.get_mpattribute("InEmail") then
  return mp.INFECTED
end
return mp.CLEAN
