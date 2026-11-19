-- Threat: !InfrastructureShared
-- Name: 3361451419be
-- Type: 21

if mp.getfilesize() >= 327680 and mp.getfilesize() <= 393216 then
  return mp.INFECTED
end
return mp.CLEAN
