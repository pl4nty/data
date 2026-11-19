-- Threat: !InfrastructureShared
-- Name: bf78b1fcb5ec
-- Type: 21

if mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
