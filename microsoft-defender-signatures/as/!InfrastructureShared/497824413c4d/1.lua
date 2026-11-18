-- Threat: !InfrastructureShared
-- Name: 497824413c4d
-- Type: 21

if mp.getfilesize() < 91000 then
  return mp.INFECTED
end
return mp.CLEAN
