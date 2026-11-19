-- Threat: !InfrastructureShared
-- Name: 3d61d559038d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
