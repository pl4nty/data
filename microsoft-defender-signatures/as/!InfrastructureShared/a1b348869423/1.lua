-- Threat: !InfrastructureShared
-- Name: a1b348869423
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\mssenses.exe", 1, true) or string.find(l_0_0, "\\mssense.exe", 1, true)) then
  return mp.CLEAN
end
return mp.INFECTED
