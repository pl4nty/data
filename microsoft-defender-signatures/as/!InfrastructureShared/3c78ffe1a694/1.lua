-- Threat: !InfrastructureShared
-- Name: 3c78ffe1a694
-- Type: 21

if mp.getfilesize() > 2000000 and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
