-- Threat: !InfrastructureShared
-- Name: ff78457a576c
-- Type: 21

if peattributes.no_security and pehdr.NumberOfSections == 4 and pesecs[3].Name == ".data" and pesecs[4].Name == ".rsrc" then
  return mp.INFECTED
end
return mp.CLEAN
