-- Threat: !InfrastructureShared
-- Name: 49787750397e
-- Type: 21

if mp.getfilesize() < 16384 and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
