-- Threat: !InfrastructureShared
-- Name: 7a788eca49c4
-- Type: 21

if mp.getfilesize() <= 4000 then
  return mp.INFECTED
end
return mp.CLEAN
