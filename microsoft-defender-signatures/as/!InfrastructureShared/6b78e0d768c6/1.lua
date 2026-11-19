-- Threat: !InfrastructureShared
-- Name: 6b78e0d768c6
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
