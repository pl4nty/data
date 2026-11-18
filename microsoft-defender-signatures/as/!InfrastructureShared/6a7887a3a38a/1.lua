-- Threat: !InfrastructureShared
-- Name: 6a7887a3a38a
-- Type: 21

if mp.getfilesize() < 2576 and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
