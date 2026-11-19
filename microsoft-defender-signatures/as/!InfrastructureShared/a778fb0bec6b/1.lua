-- Threat: !InfrastructureShared
-- Name: a778fb0bec6b
-- Type: 21

if mp.getfilesize() > 307200 then
  return mp.CLEAN
end
return mp.INFECTED
