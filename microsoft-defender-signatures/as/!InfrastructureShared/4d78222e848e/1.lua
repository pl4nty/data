-- Threat: !InfrastructureShared
-- Name: 4d78222e848e
-- Type: 21

if mp.getfilesize() > 300000 then
  return mp.CLEAN
end
return mp.INFECTED
