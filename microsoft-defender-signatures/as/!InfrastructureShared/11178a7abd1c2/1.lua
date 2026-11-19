-- Threat: !InfrastructureShared
-- Name: 11178a7abd1c2
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
