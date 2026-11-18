-- Threat: !InfrastructureShared
-- Name: b478f2c0af65
-- Type: 21

if pehdr == nil or pesecs == nil or pehdr.NumberOfSections == nil or pehdr.NumberOfSections == 0 then
  return mp.CLEAN
end
if (pesecs[pehdr.NumberOfSections].Name == ".reloc" or pesecs[pehdr.NumberOfSections].Name == " .rsrc") and pesecs[pehdr.NumberOfSections].Characteristics == 3758096448 then
  return mp.INFECTED
end
return mp.CLEAN
