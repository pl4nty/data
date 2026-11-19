-- Threat: !InfrastructureShared
-- Name: 65296729ff13
-- Type: 21

if mp.getfilesize() < 15360 then
  return mp.INFECTED
end
return mp.CLEAN
