-- Threat: !InfrastructureShared
-- Name: 31787783e3bc
-- Type: 21

local l_0_0 = pehdr.NumberOfSections
if pesecs[l_0_0].Characteristics == 3758096480 and pesecs[l_0_0 - 1].Characteristics == 3758096480 and pesecs[l_0_0 - 2].Characteristics == 3758096480 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
