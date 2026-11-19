-- Threat: !InfrastructureShared
-- Name: 21d06751afa1
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "oleObject%d%.bin$") ~= nil or string.find(l_0_0, "%.bin%->%(Ole Stream %d%)$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
