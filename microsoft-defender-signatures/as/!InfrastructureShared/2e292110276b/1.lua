-- Threat: !InfrastructureShared
-- Name: 2e292110276b
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "->%(Ole Stream %d%)$") ~= nil and mp.get_mpattribute("InEmail") then
  return mp.INFECTED
end
return mp.CLEAN
