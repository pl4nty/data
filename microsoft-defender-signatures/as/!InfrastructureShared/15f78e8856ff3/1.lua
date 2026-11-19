-- Threat: !InfrastructureShared
-- Name: 15f78e8856ff3
-- Type: 21

if mp.getfilesize() < 4140000 then
  return mp.INFECTED
end
return mp.CLEAN
