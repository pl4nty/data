-- Threat: !InfrastructureShared
-- Name: 202958a86d40
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "->%(Ole Stream %d%)$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
