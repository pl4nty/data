-- Threat: !InfrastructureShared
-- Name: c678ed691ed4
-- Type: 21

if mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
