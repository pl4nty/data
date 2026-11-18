-- Threat: !InfrastructureShared
-- Name: 707897e87d61
-- Type: 21

if mp.getfilesize() <= 184320 and mp.getfilesize() >= 10240 then
  return mp.INFECTED
end
return mp.CLEAN
