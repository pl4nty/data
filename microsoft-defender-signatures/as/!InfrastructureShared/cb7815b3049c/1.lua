-- Threat: !InfrastructureShared
-- Name: cb7815b3049c
-- Type: 21

if mp.getfilesize() > 512000 then
  return mp.CLEAN
end
return mp.INFECTED
