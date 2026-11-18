-- Threat: !InfrastructureShared
-- Name: 3378d4b729cc
-- Type: 21

if mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
