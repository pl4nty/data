-- Threat: !InfrastructureShared
-- Name: af78b9095b29
-- Type: 21

if mp.getfilesize() > 300000000 then
  return mp.INFECTED
end
return mp.CLEAN
