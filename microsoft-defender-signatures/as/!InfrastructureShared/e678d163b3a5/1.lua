-- Threat: !InfrastructureShared
-- Name: e678d163b3a5
-- Type: 21

if mp.getfilesize() > 358000000 then
  return mp.INFECTED
end
return mp.CLEAN
