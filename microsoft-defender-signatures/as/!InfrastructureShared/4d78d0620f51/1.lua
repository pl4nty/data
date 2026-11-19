-- Threat: !InfrastructureShared
-- Name: 4d78d0620f51
-- Type: 21

if mp.getfilesize() < 5376 and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
