-- Threat: !InfrastructureShared
-- Name: 7d789f0e95d5
-- Type: 21

if pehdr.NumberOfSections == 6 and pesecs[6].Name == ".reloc" and pesecs[6].Characteristics == 3791650880 then
  return mp.INFECTED
end
return mp.CLEAN
