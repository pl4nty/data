-- Threat: !InfrastructureShared
-- Name: a978eb0f2df2
-- Type: 21
-- Flags: 1

if peattributes.packed or pehdr.NumberOfSections > 8 and pesecs[1].Name == "" then
  return mp.INFECTED
end
return mp.CLEAN
