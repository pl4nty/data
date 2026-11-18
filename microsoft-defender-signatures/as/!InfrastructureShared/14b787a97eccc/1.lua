-- Threat: !InfrastructureShared
-- Name: 14b787a97eccc
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
