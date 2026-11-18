-- Threat: !InfrastructureShared
-- Name: 7d783bd41157
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
