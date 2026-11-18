-- Threat: !InfrastructureShared
-- Name: 8178c9e7cb15
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
