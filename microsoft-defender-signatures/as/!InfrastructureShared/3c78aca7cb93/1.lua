-- Threat: !InfrastructureShared
-- Name: 3c78aca7cb93
-- Type: 21

if mp.getfilesize() < 7000 then
  return mp.INFECTED
end
return mp.CLEAN
