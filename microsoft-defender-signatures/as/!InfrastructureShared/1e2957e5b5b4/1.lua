-- Threat: !InfrastructureShared
-- Name: 1e2957e5b5b4
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "->%(Ole Stream %d%)$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
