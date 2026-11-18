-- Threat: !InfrastructureShared
-- Name: 8e7871d68d22
-- Type: 21

if mp.getfilesize() < 12288 and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
