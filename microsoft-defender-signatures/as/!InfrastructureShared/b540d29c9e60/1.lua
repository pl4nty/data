-- Threat: !InfrastructureShared
-- Name: b540d29c9e60
-- Type: 21

if mp.getfilesize() > 32768 then
  return mp.CLEAN
end
return mp.INFECTED
