-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousSectionName
-- Type: 9

if pehdr.NumberOfSections >= 2 and pesecs[pehdr.NumberOfSections].Name == ".imports" then
  return mp.INFECTED
end
return mp.CLEAN
