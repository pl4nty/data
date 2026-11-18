-- Threat: !InfrastructureShared
-- Name: a978106c5665
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
