-- Threat: !InfrastructureShared
-- Name: 3c789c14f199
-- Type: 21

if mp.getfilesize() < 8192 and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
