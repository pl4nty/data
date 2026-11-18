-- Threat: !InfrastructureShared
-- Name: ce2950b8c4b6
-- Type: 21

if mp.getfilesize() < 15360 then
  return mp.INFECTED
end
return mp.CLEAN
