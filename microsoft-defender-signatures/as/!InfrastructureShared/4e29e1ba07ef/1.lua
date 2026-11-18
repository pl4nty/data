-- Threat: !InfrastructureShared
-- Name: 4e29e1ba07ef
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "workbook.bin", 1, true) ~= nil and mp.getfilesize() < 400 then
  return mp.INFECTED
end
return mp.CLEAN
