-- Threat: !InfrastructureShared
-- Name: 69783d82e137
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
