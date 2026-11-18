-- Threat: !InfrastructureShared
-- Name: 3d78d214459d
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 355842 then
  return mp.INFECTED
end
return mp.CLEAN
