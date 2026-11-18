-- Threat: !InfrastructureShared
-- Name: 5b7892687ea2
-- Type: 21

if mp.getfilesize() >= 262144 then
  return mp.CLEAN
end
return mp.INFECTED
