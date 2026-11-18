-- Threat: !InfrastructureShared
-- Name: 232995d3b801
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "->%(Ole Stream %d%)$") ~= nil and mp.get_mpattribute("InEmail") then
  return mp.INFECTED
end
return mp.CLEAN
