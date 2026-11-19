-- Threat: !InfrastructureShared
-- Name: 2f78a4ac3dc5
-- Type: 21

if pesecs[5].Name == ".bak" and pesecs[6].Name == ".bak" and pesecs[7].Name == ".bak" and mp.getfilesize() > 600000 then
  return mp.INFECTED
end
return mp.CLEAN
