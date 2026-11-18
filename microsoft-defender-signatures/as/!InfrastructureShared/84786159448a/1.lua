-- Threat: !InfrastructureShared
-- Name: 84786159448a
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
