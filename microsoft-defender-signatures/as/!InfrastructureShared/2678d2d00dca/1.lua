-- Threat: !InfrastructureShared
-- Name: 2678d2d00dca
-- Type: 21

if mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
