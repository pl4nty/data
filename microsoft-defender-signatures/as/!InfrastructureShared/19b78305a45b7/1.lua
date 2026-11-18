-- Threat: !InfrastructureShared
-- Name: 19b78305a45b7
-- Type: 21

if mp.getfilesize() > 10485760 then
  return mp.CLEAN
end
return mp.INFECTED
