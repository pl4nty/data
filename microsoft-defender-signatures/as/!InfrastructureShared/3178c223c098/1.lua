-- Threat: !InfrastructureShared
-- Name: 3178c223c098
-- Type: 21

if mp.getfilesize() < 130000 then
  return mp.INFECTED
end
return mp.CLEAN
