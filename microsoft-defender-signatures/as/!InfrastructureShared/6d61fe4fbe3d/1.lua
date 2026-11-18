-- Threat: !InfrastructureShared
-- Name: 6d61fe4fbe3d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
