-- Threat: !InfrastructureShared
-- Name: 9540a1582de9
-- Type: 21

if mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
