-- Threat: !InfrastructureShared
-- Name: 4229aa3858b0
-- Type: 21

if mp.getfilesize() <= 17408 and mp.getfilesize() > 2048 then
  return mp.INFECTED
end
return mp.CLEAN
