-- Threat: !InfrastructureShared
-- Name: 8a783d512470
-- Type: 21

if mp.getfilesize() >= 262144 then
  return mp.CLEAN
end
return mp.INFECTED
