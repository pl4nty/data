-- Threat: !InfrastructureShared
-- Name: 6378c3d0865e
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
