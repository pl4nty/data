-- Threat: !InfrastructureShared
-- Name: 4829dfddfe9d
-- Type: 21

if mp.getfilesize() <= 2048 then
  return mp.INFECTED
end
return mp.CLEAN
