-- Threat: !InfrastructureShared
-- Name: a878d31b2783
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
