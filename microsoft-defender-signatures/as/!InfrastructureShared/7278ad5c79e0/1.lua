-- Threat: !InfrastructureShared
-- Name: 7278ad5c79e0
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
