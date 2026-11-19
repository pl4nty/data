-- Threat: !InfrastructureShared
-- Name: 9678fb7ad383
-- Type: 21

if mp.getfilesize() > 512000 then
  return mp.CLEAN
end
return mp.INFECTED
