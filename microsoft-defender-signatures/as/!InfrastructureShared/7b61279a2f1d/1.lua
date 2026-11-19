-- Threat: !InfrastructureShared
-- Name: 7b61279a2f1d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
