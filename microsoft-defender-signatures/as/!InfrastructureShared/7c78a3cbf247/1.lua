-- Threat: !InfrastructureShared
-- Name: 7c78a3cbf247
-- Type: 21

if mp.getfilesize() > 330000000 then
  return mp.INFECTED
end
return mp.CLEAN
