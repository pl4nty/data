-- Threat: !InfrastructureShared
-- Name: 5c7883ab74c9
-- Type: 21

if mp.getfilesize() >= 300000 and mp.getfilesize() <= 400000 then
  return mp.INFECTED
end
return mp.CLEAN
