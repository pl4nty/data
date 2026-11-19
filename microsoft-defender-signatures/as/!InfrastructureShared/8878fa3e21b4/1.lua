-- Threat: !InfrastructureShared
-- Name: 8878fa3e21b4
-- Type: 21

if mp.getfilesize() < 31457280 then
  return mp.INFECTED
end
return mp.CLEAN
