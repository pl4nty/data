-- Threat: !InfrastructureShared
-- Name: 1088ff72c5595
-- Type: 21

if mp.getfilesize() < 150000 then
  return mp.INFECTED
end
return mp.CLEAN
