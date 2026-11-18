-- Threat: !InfrastructureShared
-- Name: 277802ddda7e
-- Type: 21

if pehdr.NumberOfSections > 6 and string.find(pesecs[5].Name, "^%.data%d$") and string.find(pesecs[6].Name, "^%.data%d$") and pesecs[5].Name ~= pesecs[6].Name then
  return mp.INFECTED
end
return mp.CLEAN
