-- Threat: !InfrastructureShared
-- Name: 109788f0592f6
-- Type: 21

if peattributes.packed or pehdr.NumberOfSections > 8 and pesecs[1].Name == "" then
  return mp.INFECTED
end
return mp.CLEAN
