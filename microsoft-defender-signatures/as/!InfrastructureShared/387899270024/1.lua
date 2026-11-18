-- Threat: !InfrastructureShared
-- Name: 387899270024
-- Type: 21

local l_0_0 = pehdr.NumberOfSections
local l_0_1 = pesecs[l_0_0].Name
if l_0_1 == ".TLS" and pesecs[l_0_0].Characteristics == 3221225472 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
