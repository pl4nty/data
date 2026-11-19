-- Threat: !InfrastructureShared
-- Name: 4029618c3cd6
-- Type: 21

if mp.getfilesize() <= 256 then
  return mp.INFECTED
end
return mp.CLEAN
