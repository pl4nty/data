-- Threat: !InfrastructureShared
-- Name: 737803701e56
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
