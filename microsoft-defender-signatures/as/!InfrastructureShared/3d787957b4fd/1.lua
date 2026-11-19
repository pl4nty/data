-- Threat: !InfrastructureShared
-- Name: 3d787957b4fd
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
