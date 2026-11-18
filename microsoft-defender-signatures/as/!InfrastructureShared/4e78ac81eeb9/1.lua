-- Threat: !InfrastructureShared
-- Name: 4e78ac81eeb9
-- Type: 21

if mp.get_mpattribute("pea_isdll") and pehdr ~= nil and pehdr.NumberOfSections > 2 and pesecs[1].Name == ".text" and pesecs[pehdr.NumberOfSections].Name == ".reloc" then
  return mp.INFECTED
end
return mp.CLEAN
