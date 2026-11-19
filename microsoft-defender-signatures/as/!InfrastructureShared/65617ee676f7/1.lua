-- Threat: !InfrastructureShared
-- Name: 65617ee676f7
-- Type: 21

if pehdr.NumberOfSections == 4 and pesecs[4].Name == ".mdn" then
  return mp.INFECTED
end
return mp.CLEAN
