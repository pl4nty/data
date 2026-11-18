-- Threat: !InfrastructureShared
-- Name: 1578adb98bde
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security and 145000 < l_0_0 and l_0_0 < 179000 and pehdr.NumberOfSections == 4 and pesecs[3].Name == "CONST" and pesecs[3].SizeOfRawData <= 8192 and pesecs[3].SizeOfRawData >= 2048 then
  return mp.INFECTED
end
return mp.CLEAN
