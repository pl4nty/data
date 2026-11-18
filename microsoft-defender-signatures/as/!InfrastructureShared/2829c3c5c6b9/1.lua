-- Threat: !InfrastructureShared
-- Name: 2829c3c5c6b9
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "->%(Ole Stream %d%)$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
