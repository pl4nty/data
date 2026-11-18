-- Threat: !InfrastructureShared
-- Name: ae788cfe89e8
-- Type: 21

if mp.getfilesize() < 60000 then
  return mp.INFECTED
end
return mp.CLEAN
