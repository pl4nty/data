-- Threat: !InfrastructureShared
-- Name: cd78f79757bb
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
