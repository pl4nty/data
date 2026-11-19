-- Threat: !InfrastructureShared
-- Name: 3d78567f09a1
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
