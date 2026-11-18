-- Threat: !InfrastructureShared
-- Name: 21780b25694b
-- Type: 21

local l_0_0 = pehdr.NumberOfSections
local l_0_1 = pesecs[l_0_0].Name
if l_0_1 == ".seh" and pesecs[l_0_0].Characteristics == 3221225536 and peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
