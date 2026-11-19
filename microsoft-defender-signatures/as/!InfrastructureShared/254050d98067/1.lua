-- Threat: !InfrastructureShared
-- Name: 254050d98067
-- Type: 21

if mp.getfilesize() > 1000000 then
  return mp.CLEAN
end
return mp.INFECTED
