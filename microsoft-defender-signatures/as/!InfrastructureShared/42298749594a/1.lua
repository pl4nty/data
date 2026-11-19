-- Threat: !InfrastructureShared
-- Name: 42298749594a
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "workbook.bin", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
