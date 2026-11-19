-- Threat: !InfrastructureShared
-- Name: 8b7846659bc6
-- Type: 21

if mp.getfilesize() > 300000000 then
  return mp.INFECTED
end
return mp.CLEAN
