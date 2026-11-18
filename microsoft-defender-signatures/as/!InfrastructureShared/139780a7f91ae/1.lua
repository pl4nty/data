-- Threat: !InfrastructureShared
-- Name: 139780a7f91ae
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
