-- Threat: !InfrastructureShared
-- Name: 57783a4a12a7
-- Type: 21

if mp.getfilesize() > 300000000 then
  return mp.INFECTED
end
return mp.CLEAN
