-- Threat: !InfrastructureShared
-- Name: d141aad29c74
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
