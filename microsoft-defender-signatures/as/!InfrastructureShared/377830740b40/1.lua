-- Threat: !InfrastructureShared
-- Name: 377830740b40
-- Type: 21

if peattributes.no_security and pehdr.NumberOfSections == 5 and pesecs[4].Name == ".rsrc" and pesecs[4].Characteristics == 1073741888 then
  return mp.INFECTED
end
return mp.CLEAN
